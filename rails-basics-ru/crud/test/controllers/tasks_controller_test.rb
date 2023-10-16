require_relative "../test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @attrs = {
      name: Faker::Artist.name,
      description: Faker::Movies::HarryPotter.quote,
      status: Faker::Movies::HarryPotter.spell,
      creator: Faker::Movies::HarryPotter.character,
      performer: Faker::Movies::HarryPotter.character,
      completed: true
    }
  end

  test 'should get index' do
    get tasks_path
    assert_response :success
  end

  test 'should get action show' do
    get task_path(tasks(:one))
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post '/tasks', params: { task: @attrs }
    end
    assert_redirected_to task_path(Task.last)
    assert_equal 'Task was created', flash[:success]
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_path(@task)
    end
    assert_redirected_to tasks_path
  end

  test 'should update task' do
    task = tasks(:one)
    patch "/tasks/#{task.id}", params: { task: @attrs }

    task.reload

    assert { task.name == @attrs[:name] }
    assert_redirected_to task_url(task)
  end
end
