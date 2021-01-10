class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]


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
            flash.now[:notice] = @user.errors.full_messages.to_sentence
            render :new
        end
    end 

    def show
        @user = User.find_by(id: params[:id])
    end

    def edit
    end 

    def update
        @user.update(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else 
            flash.now[:notice] = @user.errors.full_messages.to_sentence
            redirect_to edit_user_path(@user)
        end 
    end 

    def destroy
        @user.destroy
        redirect_to welcome_path
    end 

    private

    def set_user
        @user = User.find_by(id: params[:id])
    end 

    def user_params
        params.require(:user).permit(
            :first_name, 
            :last_name,
            :email,
            :password
        )
    end 

end
