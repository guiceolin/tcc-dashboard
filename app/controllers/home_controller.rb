class HomeController < ApplicationController

  def desktop
    @project = Project.find(current_user.current_project)
    render :layout => 'application'
  end

  def home

  end

end
