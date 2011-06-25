class RolesController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    debugger
    @user.type = params[:user][:type]
    respond_to do |format|
      if @user.save
        format.html { redirect_to(root_url , :notice => 'Role was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
