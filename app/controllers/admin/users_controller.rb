class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  before_action :require_is_admin
  layout "admin"

  def index
    @users = case params[:order]
    when 'username'
      User.all.name_alphabetical
    when 'username_rev'
      User.all.name_alphabetical_rev
    else
      User.all
    end
    @users = @users.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:warning] = "changed"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    flash[:warning] = "deleted"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :is_admin)
  end
end
