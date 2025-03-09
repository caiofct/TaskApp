require "openai"

class OpenAiService
  def self.generate_list_with_tasks(list_name)
    api_key = Rails.application.credentials.dig(:openai, :api_key)

    unless api_key
      Rails.logger.error("OpenAI API key not found")
      return { error: "API key not configured", tasks: [] }
    end

    client = OpenAI::Client.new(access_token: api_key)

    prompt = "Generate a list of tasks for a list called '#{list_name}'. " \
             "Return the response as a JSON array of task names. " \
             "For example: [\"Task 1\", \"Task 2\", \"Task 3\"]"

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "You are a helpful assistant that generates task lists." },
          { role: "user", content: prompt }
        ],
        temperature: 0.7
      }
    )

    if response["choices"] && response["choices"].first["message"]
      content = response["choices"].first["message"]["content"]

      begin
        JSON.parse(content).with_indifferent_access
      rescue JSON::ParserError => e
        Rails.logger.error("Failed to parse OpenAI response: #{e.message}")
        # Try to extract tasks using regex if JSON parsing fails
        tasks = content.scan(/"([^"]+)"/).flatten
        { tasks: tasks.presence || [] }
      end
    else
      Rails.logger.error("OpenAI API error: #{response.inspect}")
      { error: "Failed to generate tasks", tasks: [] }
    end
  end
end
