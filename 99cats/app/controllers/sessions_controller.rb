class SessionsController < ApplicationController
  def new 
    render :new
  end
  
  def create 
    user = User.find_by_credentials(params[:users][:user_name], params[:users][:password])
    login!(user)
    redirect_to cats_url
  end

  def destroy 
  end
end