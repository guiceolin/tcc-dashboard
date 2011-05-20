class ProjectsController < InheritedResources::Base
  load_and_authorize_resource

  def create
    @project = Project.new(params[:project]) 
    current_user.associate_managed_project(@project)
    create!
  end

  protected

  def begin_of_association_chain
    current_user
  end

end
