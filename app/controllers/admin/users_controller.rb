class Admin::UsersController < ApplicationController

  def index
    @users = User.all
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
