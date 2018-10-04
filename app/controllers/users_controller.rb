class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @user = User.new
  end

  def create
   @user = User.create(user_params)
   if @user.valid?
     session[:user_id] = @user.id
     redirect_to @user
   else
     flash[:error] = @user.errors.full_messages
     redirect_to new_user_path
   end
  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :user_id, :matched_user_id, :password, :password_confirmation)
  end

end
