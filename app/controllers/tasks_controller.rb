class TasksController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :task, :through => :project

  def index
    @tasks = Project.find(params[:project_id]).tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
  end

  def create
    @task = Task.new(params[:task])
    @task.project_id = params[:project_id]

    @task.save
    flash[:notice] = 'Tarefa criada'
    redirect_to project_path(params[:project_id])
  end

  def start
    @task = Task.find(params[:id])
    @task.user = current_user
    @task.start
    @task.save

    flash[:notice] = 'Tarefa iniciada'
    redirect_to project_path(@task.project)
  end

  def complete
    @task = Task.find(params[:id])
    @task.complete
    @task.save

    flash[:notice] = 'Tarefa concluida'
    redirect_to project_path(@task.project)
  end
end
