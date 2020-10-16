class SessionsController < ApplicationController

    def welcome
    end 

    def new
    end 

    def create
        if request.env["omniauth.auth"]
            # Logged in via OAuth
            raise auth_hash.inspect 
            oauth_user_name = request.env["omniauth.auth"]["user_name"]
            if @user = User.find_by(user_name: params[:user_name])
                session[:user_id] = @user.id

                redirect_to root_path
            else 
                byebug
                user = User.create(:user_name => oauth_user_name)

                redirect_to root_path
            end 
        else
            # Normal Login
            @user = User.find_by(user_name: params[:user_name])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to recipes_path
            else
                flash[:notice] = @user.errors.full_messages.join(" ")
                redirect_to login_path
            end
        end 
    end

    def destroy
        session.clear
        redirect_to root_path
    end 

end 