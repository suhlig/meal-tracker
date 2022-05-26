class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:notice] = 'Benutzer wurde gelöscht.'
    redirect_to(users_url)
  end
end
