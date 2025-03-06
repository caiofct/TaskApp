require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @list = @task.list
  end

  test "should get index" do
    get list_tasks_url(@list)
    assert_response :success
  end

  test "should get new" do
    get new_list_task_url(@list)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post list_tasks_url(@list), params: { task: { completed: @task.completed, description: @task.description } }
    end

    assert_redirected_to list_task_url(@list, Task.last)
  end

  test "should show task" do
    get list_task_url(@list, @task)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_task_url(@list, @task)
    assert_response :success
  end

  test "should update task" do
    patch list_task_url(@list, @task), params: { task: { completed: @task.completed, description: @task.description } }
    assert_redirected_to list_task_url(@list, @task)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete list_task_url(@list, @task)
    end

    assert_redirected_to list_tasks_url(@list)
  end
end
