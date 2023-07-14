class SessionsController < ApplicationController
  def create
    user  = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.name}!"

      redirect_to root_path
    else
      flash[:error] = 'Authentication failed!'
      redirect_to root_path
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Goodbye!'
    end
    redirect_to root_path
  end
end
