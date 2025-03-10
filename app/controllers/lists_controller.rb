class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists
  def index
    @lists = List.order(created_at: :desc)
    @list = @lists.first
  end

  # GET /lists/1
  def show
    @lists = List.order(created_at: :desc)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new
    end
  end

  # POST /lists/generate
  def generate_with_ai
    list_name = params[:list_name]

    if list_name.present?
      result = OpenAiService.generate_list_with_tasks(list_name)
      tasks = result[:tasks]
      if tasks.present?
        List.transaction do
          @list = List.create!(name: list_name)
          tasks.each do |task_name|
            @list.tasks.create!(description: task_name)
          end
        end
        respond_to do |format|
          format.html { redirect_to @list, notice: "List was successfully generated with AI." }
        end
      else
        redirect_to lists_path, alert: "No task was generated. Please try a different list name/prompt"
      end
    else
      redirect_to lists_path, alert: "Please provide a list name."
    end
  end

  # PATCH/PUT /lists/1
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: "List was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy!

    respond_to do |format|
      format.html { redirect_to lists_path, status: :see_other, notice: "List was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.expect(list: [ :name ])
    end
end
