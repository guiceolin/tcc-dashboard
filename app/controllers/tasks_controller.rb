class TasksController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :task, :through => :project

  def index
    @tasks = Project.find(params[:project_id]).tasks
  end

  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
  end

  def create
    @task = Task.new(params[:task])
    @task.project_id = params[:project_id]

    @task.save
    redirect_to project_tasks_path(params[:project_id])
  end

  def start
    @task = Task.find(params[:id])
    @task.start
    @task.save

    redirect_to project_tasks_path(@task.project)
  end

  def complete
    @task = Task.find(params[:id])
    @task.complete
    @task.save

    redirect_to project_tasks_path(@task.project)
  end
end
