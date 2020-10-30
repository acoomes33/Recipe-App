class SessionsController < ApplicationController
  skip_before_action :verified_user

  def welcome
  end 

  def new
  end 

  def google
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
        user.first_name = auth["info"]["first_name"]
        user.last_name = auth["info"]["last_name"]
        user.password = SecureRandom.hex(8)
      end
      if @user && @user.id
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to login_path
      end
  end  

  def create
      # Normal Login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
      redirect_to login_path, notice: "Incorrect email and/or password, please try again."
    end 
  end

  def destroy
    session.clear
    redirect_to root_path
  end 

  private
      
  def auth
    request.env['omniauth.auth']
  end

end 