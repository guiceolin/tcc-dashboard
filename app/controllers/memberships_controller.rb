class MembershipsController < ApplicationController
    load_and_authorize_resource :project
    load_and_authorize_resource :membership, :through => :project

  def index
    @memberships = Project.find(params[:project_id]).memberships
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(params[:membership])
    @membership.project_id = params[:project_id]

    @membership.save
    redirect_to project_memberships_path(@membership.project)
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def update
    @membership = Membership.find(params[:id])
    @membership.update_attributes params[:membership]

    @membership.save
    redirect_to project_memberships_path(@membership.project)
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    redirect_to project_path(@membership.project)
  end
end
