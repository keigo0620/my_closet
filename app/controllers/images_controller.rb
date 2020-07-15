class ImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      flash[:notice] = "You have post image successfully."
      redirect_to image_path(@image.id)
    else
      @images = Image.all
      @user = current_user

      flash[:error] = "error"
      render :index
  end
end

  def index
    @user = current_user
    @images = Image.all
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
    @user = @image.user
    @new_image = Image.new
  end

  def edit
    @image = Image.find(params[:id])
    if @image.user_id = current_user.id
      redirect_to images_path
  end
end

  def update
    @image = Image.find(params[:id])
    @image.user_id = current_user.id
    if @image.update(image_params)
      flash[:notice] = "you have post image successfully."
      redirect_to image_path(@image.id)
    else
      flash[:notice] = "error"
      render :edit
  end
end

  def destory
    @image = Image.find(params[:id])
    @image.destory
    redirect_to images_path
  end
  
  private
  def book_params
  params.require(:book).permit(:title, :body)
end
end
