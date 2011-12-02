class VersionsController < ApplicationController

  def index
    @versions = Version.paginate(:per_page => 10, :page => params[:page]).order('created_at DESC')
  end

  def show
    @version = Version.find(params[:id])
    @user = User.find(@version.terminator)
  end
end
