class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            # redirect_to user_path
            redirect_to user_path(@user)
        else
            flash[:notice] = @user.errors.full_messages.join(" ")
            render :new
        end
    end 

    def show
        @user = User.find_by(id: params[:id])
    end

    def edit 
    end 

    def update
    end 

    private

    def user_params
        params.require(:user).permit(
            :user_name, 
            :password, 
            :first_name, 
            :last_name
        )
    end 

end
