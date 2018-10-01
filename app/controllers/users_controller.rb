class UsersController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def find_listing
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :user_id, :matched_user_id)
  end

end
