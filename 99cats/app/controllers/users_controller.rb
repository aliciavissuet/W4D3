class UsersController < ApplicationController
  def index 
    @users = User.all
    render :index
  end
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      # login!(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end

  def user_params
    params.require(:users).permit(:user_name, :password)
  end
end