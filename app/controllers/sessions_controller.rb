class SessionsController < ApplicationController

    def welcome
    end 

    def new
    end 

    def create
        @user = User.find_by(user_name: params[:user_name])
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

end 