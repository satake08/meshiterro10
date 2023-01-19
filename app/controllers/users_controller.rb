class UsersController < ApplicationController
  def show
    @user = PostImage.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = PostImage.find(params[:id])
  end
  
  def update
    @user = PostImage.find(params[:id])
    @user.update(post_images_params)
    redirect_to post_images_path(post_images.id) 
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
