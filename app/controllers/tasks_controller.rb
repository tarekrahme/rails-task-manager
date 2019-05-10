class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def find_task
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(user_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(user_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def user_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
