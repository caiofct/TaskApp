class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /lists/tasks or /lists/tasks.json
  def index
    @tasks = @list.tasks
  end

  # GET /lists/tasks/1 or /lists/tasks/1.json
  def show
  end

  # GET /lists/tasks/new
  def new
    @task = Task.new(list: @list)
  end

  # GET /lists/tasks/1/edit
  def edit
  end

  # POST /lists/tasks or /lists/tasks.json
  def create
    @task = Task.new(task_params)
    @task.list = @list

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_task_path(@list, @task), notice: "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/tasks/1 or /lists/tasks/1.json
  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to @task.list }
        format.turbo_stream
      end
    else
      render :edit
    end
  end

  # DELETE /lists/tasks/1 or /lists/tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to list_tasks_path(@list), status: :see_other, notice: "Task was successfully destroyed." }
      format.turbo_stream
      format.json { head :no_content }
    end
  end

  private
    def set_list
      @list = List.find(params.expect(:list_id))
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @list.tasks.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.expect(task: [ :description, :completed ])
    end
end
