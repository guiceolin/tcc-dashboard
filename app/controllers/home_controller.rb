class HomeController < ApplicationController

  #layout 'desktop', :only => :desktop

  def desktop
    @projects = current_user.projects
    @managed_projects = current_user.managed_projects if current_user.is_a? Manager
    #flash[:alert] = 'Mensagem de Teste do Flash'
    render :layout => 'desktop'
  end

  def home

  end

end
