class MasterProjectsController < ApplicationController

  before_filter :find_current

  def index
    @masters = current_user.master_projects
  end

  def new
    @master = MasterProject.new
  end

  def edit
  end

  def create
    @master = MasterProject.new(params[:master_project])
    @master.owner = current_user
    respond_to do |format|
      if @master.save
        format.html { redirect_to(@master, :notice => 'Projeto criado com sucesso!') }
        format.xml  { render :xml => @master, :status => :created, :location => @master }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @master.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @master.update_attributes params[:master_project]
    respond_to do |format|
      if @master.save
        format.html { redirect_to(@master, :notice => 'Projeto criado com sucesso!') }
        format.xml  { render :xml => @master, :status => :created, :location => @master }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @master.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @master = MasterProject.find_by_id(params[:id])
  end

  def finish
    @master.finish
    @master.save
    redirect_to @master
  end
  private

  def find_current
    @master = current_user.current_master_project
  end
end
