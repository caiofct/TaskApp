# Task List Generator with AI

This Rails application allows users to create and manage task lists with the help of OpenAI's GPT model. The app provides a simple and intuitive interface for creating lists manually or generating them automatically using AI.

## Features

- **AI-Powered List Generation**: Enter a list name (e.g., "Grocery store list") and the app will use OpenAI to generate a relevant list of tasks
- **Manual List Creation**: Create lists and tasks manually
- **List Management**: View, edit, and delete lists and their associated tasks
- **Responsive Design**: Clean, modern UI built with Tailwind CSS

## Technical Stack

- **Framework**: Ruby on Rails 8.0
- **Database**: PostgreSQL
- **Frontend**: Tailwind CSS, Hotwire (Turbo + Stimulus)
- **AI Integration**: OpenAI GPT-3.5 Turbo via ruby-openai gem

## Setup

### Prerequisites

- Ruby 3.x
- Rails 8.0.x
- PostgreSQL
- OpenAI API key

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/task-list-generator.git
   cd task-list-generator
   ```

2. Install dependencies:
   ```
   bundle install
   ```

3. Set up the database:
   ```
   rails db:create db:migrate
   ```

4. Configure your OpenAI API key:
   ```
   EDITOR="vim" rails credentials:edit
   ```

   Add your OpenAI API key to the credentials file:
   ```yaml
   openai:
     api_key: your_openai_api_key_here
   ```

5. Start the server:
   ```
   rails server
   ```

6. Visit `http://localhost:3000` in your browser

## Usage

### Generating Lists with AI

1. On the homepage, find the "Generate List with AI" form
2. Enter a descriptive list name (e.g., "Weekend camping trip", "Office supplies", "Birthday party planning")
3. Click "Generate with AI"
4. The app will create a new list with AI-generated tasks based on your input

### Managing Lists Manually

- Create new lists using the "New List" button
- Add tasks to existing lists
- Mark tasks as complete by checking them
- Edit or delete tasks as needed

## How It Works

The application uses the OpenAI GPT-3.5 Turbo model to generate task lists. When a user submits a list name:

1. The app sends a request to the OpenAI API with a prompt asking for tasks related to the list name
2. The API returns a JSON array of task names
3. The app creates a new list with the provided name and populates it with the generated tasks
4. The user can then view and manage the generated list like any other list in the system

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
