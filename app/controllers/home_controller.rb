class HomeController < ApplicationController

  def desktop
    if current_user.is_a? Manager
      manager_desktop
    else
      @project = current_user.current_project
      render 'desktop', :layout => 'application'
    end
  end

  def home

  end

  private

  def manager_desktop
    @project = current_user.current_master_project
    render 'manager_desktop', :layout => 'application'
  end
end
