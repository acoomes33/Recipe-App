class SessionsController < ApplicationController

    def welcome
    end 

    def new
    end 

    def google
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
          user.first_name = auth["info"]["first_name"]
          user.last_name = auth["info"]["last_name"]
          user.password= SecureRandom.hex(8)
        end
        if @user && @user.id
          session[:user_id] = @user.id
          redirect_to recipes_path
        else
          redirect_to login_path
        end
      end  

    def create
        # Normal Login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to recipes_path
        else
            flash[:notice] = @user.errors.full_messages.join(" ")
            redirect_to login_path
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