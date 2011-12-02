class HomeController < ApplicationController

  def desktop
    if current_user.is_a? Manager
      @project = current_user.current_master_project
      redirect_to @project
    else
      @project = current_user.current_project
      redirect_to @project
    end
  end

  def home

  end

  private

  def manager_desktop

  end
end
