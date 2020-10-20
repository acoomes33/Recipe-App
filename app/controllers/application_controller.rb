class ApplicationController < ActionController::Base
    before_action :verified_user
    helper_method :current_user
    helper_method :logged_in?

    rescue_from CanCan::AccessDenied do |exception|
        flash[:notice] = exception.message
        redirect_to root_path
    end

    def current_user 
        User.find_by(id: session[:user_id]) if logged_in?
    end 

    def logged_in?
        !!session[:user_id]
    end 

    def verified_user
        redirect_to '/' unless user_is_authenticated
    end 

    def user_is_authenticated
        !!current_user 
    end 

end
