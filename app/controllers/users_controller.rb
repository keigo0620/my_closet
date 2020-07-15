class UsersController < ApplicationController
  before_action :authenticate_user!
  def new
    @image = Image.new
  end

  def show
    @image = Image.new
    @user = User.find(params[:id])
    @images = @user.images
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
  end
end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "post image"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error"
      render :edit
  end
end

  def index
    @user = current_user
    @image = Image.new
    @user = User.all
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
