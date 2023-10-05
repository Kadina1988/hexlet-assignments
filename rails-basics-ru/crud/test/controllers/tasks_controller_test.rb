require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get tasks_path
    assert_response :success
  end

  test 'should get action show' do
    get task_path(tasks(:one))
    assert_response :success
  end

  test 'should create task' do
    assert_difference("Task.count") do
      post '/tasks', params: { task: { name: 'Name',
                                       description: 'Desk',
                                       status: 'old',
                                       creator: 'Joe',
                                       performer: 'Jeck',
                                       completed: true
                                      }}
    end
    assert_redirected_to task_path(Task.last)
    assert_equal 'Task was created', flash[:success]
  end

  test 'should destroy task' do
    task = tasks(:one)
    assert_difference("Task.count", -1) do
      delete task_path(task)
    end
    assert_redirected_to tasks_path
  end

  test 'should update task' do
    task = tasks(:one)
    # byebug
    patch "/tasks/#{task.id}", params: { task: { name: '' } }
    # assert_redirected_to edit_task_path(task)
    assert_template :edit

    task.reload
    assert_equal 'MyString', task.name
  end

end
