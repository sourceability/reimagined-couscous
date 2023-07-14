class ApplicationController < ActionController::Base

    private

    def require_login
        return if current_user

        redirect_post('/auth/gitlab', options: { method: :post, authenticity_token: 'auto' })
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
        session[:user_id] = nil
    end

    helper_method :current_user
end
