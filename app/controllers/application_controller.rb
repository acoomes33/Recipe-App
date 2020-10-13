class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in?

    def current_user 
        User.find_by(id: session[:user_id]) if logged_in?
    end 

    def logged_in?
        !!session[:user_id]
    end 

end
