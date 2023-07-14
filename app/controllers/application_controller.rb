class ApplicationController < ActionController::Base

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
        session[:user_id] = nil
    end

    helper_method :current_user
end
