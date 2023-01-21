class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)#(post_image_params)他のところに転移しようとしてエラー
    redirect_to user_path#post_image_path他のところに転移しようとしてエラー
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
