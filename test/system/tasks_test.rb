require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
    @list = @task.list
  end

  test "visiting the index" do
    visit list_tasks_url(@list)
    assert_selector "h1", text: "Tasks"
  end

  test "should create task" do
    visit list_tasks_url(@list)
    click_on "New task"

    check "Completed" if @task.completed
    fill_in "Description", with: @task.description
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "should update Task" do
    visit list_task_url(@list, @task)
    click_on "Edit this task", match: :first

    check "Completed" if @task.completed
    fill_in "Description", with: @task.description
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "should destroy Task" do
    visit list_task_url(@list, @task)

    accept_alert do
      click_on "Destroy this task", match: :first
    end

    assert_text "Task was successfully destroyed"
  end
end
