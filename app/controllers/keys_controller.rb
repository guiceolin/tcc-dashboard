class KeysController < ApplicationController

  def index
    @keys = current_user.keys
  end

  def new
    @key = Key.new
  end

  def create
    @key = Key.new params[:key]
    @key.user = current_user
    @key.save
    redirect_to keys_path
  end

  def destroy
    @key = Key.find(params[:id])
    @key.destroy
    redirect_to keys_path
  end
end
