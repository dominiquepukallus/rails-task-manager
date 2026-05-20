class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # this is singular as it is only one task
    @task = Task.find(params[:id])
  end

  # create a form for this new task
  def new
    @task = Task.new
  end

  # post the new task which was created from above
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
