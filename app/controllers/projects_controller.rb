class ProjectsController < ActionController::Base
  load_and_authorize_resource

  layout 'application'

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
    render 'home/desktop'
  end

  def index
    @projects = current_user.projects
    @managed_projects = current_user.managed_projects if current_user.is_a? Manager
    #flash[:alert] = 'Mensagem de Teste do Flash'
    render :layout => 'application'
  end

  def update
    @project = Project.find(params[:id])

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
    current_user.associate_managed_project(@project)
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

  def update
    @project = Project.find(params[:id])

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

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end

  def users
    @project  = Project.find(params[:id])
    @members  = @project.members
    @managers = @project.managers
  end

  def set_active
    current_user.current_project_id = params[:id]
    current_user.save
    redirect_to Project.find(params[:id])
  end
end
