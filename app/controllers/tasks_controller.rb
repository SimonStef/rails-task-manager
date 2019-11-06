class TasksController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:created] = "Post successfully created"
      redirect_to tasks_path
    else
      flash[:not_created] = "erreur"
      render :new
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
    flash[:updated] = "Post successfully updated"
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
    flash[:deleted] = "Post successfully deleted"
  end

  private

  def find
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
