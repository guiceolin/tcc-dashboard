class ProjectsController < ActionController::Base
  load_and_authorize_resource :project
  before_filter :find_current

  layout 'application'

  def new
    @project = Project.new
  end

  def edit
  end

  def show
  end

  def index
    @projects = current_user.projects
  end

  def update

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end


  def create
    @project = Project.new(params[:project])
    @project.master_project = current_user.current_master_project
    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Projeto criado com sucesso!') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end

  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end

  def users
    @members  = @project.members
    @managers = @project.managers
  end

  def set_active
    if current_user.is_a? Manager
      current_user.current_master_project_id = params[:id]
    else
      current_user.current_project_id = params[:id]
    end
    current_user.save
    redirect_to current_user.current_project
  end

  def finish
    @project.finish
    @project.save
    redirect_to(@project)
  end

  def tree
    @repo = @project.repo

    if params[:commit_id].present?
      @tree = @repo.commits(params[:commit_id]).first.tree
    else
      @tree = @repo.tree
    end

    @commit = @repo.head.name

    if params[:path]
      @tree = @tree / params[:path]
    end

    if Grit::Tree === @tree
      render 'tree'
    else
      render 'blob'
    end
  end

  private

  def find_current
    if Manager === current_user
      @project = Project.find_by_id(params[:id])
    else
      @project = current_user.current_project
    end
  end
end
