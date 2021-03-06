class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "You have signed up successfully."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to root_path, notice: "Profile has been updated."
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
