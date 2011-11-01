class MasterProjectsController < ApplicationController
  def index
    @masters = current_user.master_projects
  end

  def new
    @master = MasterProject.new
  end

  def edit
    @master = MasterProject.find(params[:id])
  end

  def create
    @master = MasterProject.new(params[:master_project])
    @master.owner = current_user
    @master.save
  end

  def update
    @master = MasterProject.find(params[:id])
    @master.update_attributes params[:master_project]
    @master.save
  end

  def show
    @master = MasterProject.find(params[:id])
  end

  def finish
    @master = current_user.current_master_project
    @master.finish
    @master.save
    redirect_to @master
  end
end
