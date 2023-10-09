class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    # byebug
    if @task.save!
      flash[:success] = 'Task was created'
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to tasks_path
    else
      redirect_to task_path(@task)
    end
  end
  private

  def task_params
    params.require(:task).permit(:name,
                                 :description,
                                 :status,
                                 :creator,
                                 :performer,
                                 :completed
                                )
  end
end
