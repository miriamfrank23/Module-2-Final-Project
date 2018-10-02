class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
    flash[:danger] = 'Invalid email/password combination'
    redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] = 'You are now logged out'
    redirect_to login_path
  end

end
