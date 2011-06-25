class UsersController < ApplicationController

  def index
    @users = User.all
    authorize! :manage, User
  end

end
