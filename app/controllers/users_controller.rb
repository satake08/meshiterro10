class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]#25章
  def show
    @user = User.find(params[:id])
    #@post_images = @user.post_images 以下に変更22章
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    # ここから追加25章
    #user_id = params[:id].to_i
    #unless user_id == current_user.id
    #  redirect_to post_images_path
    #end
    # ここまで追加25章
    #上記以下一行でOK25章
    #is_matching_login_user 一番上に「before_action～」を記述により必要性が無くなり以下1行でOKになる25章最後
    @user = User.find(params[:id])
  end

  def update
    # ここから追加25章
    #user_id = params[:id].to_i
    #unless user_id == current_user.id
    #  redirect_to post_images_path
    #end
    # ここまで追加25章
    #上記以下一行でOK25章
    #is_matching_login_user 一番上に「before_action～」を記述により必要性が無くなり以下3行でOKになる25章最後
    @user = User.find(params[:id])
    @user.update(user_params)#(post_image_params)他のところに転移しようとしてエラー
    #redirect_to user_path#post_image_path他のところに転移しようとしてエラー
    #以下に記述変更
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  # ここから追加25章
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
  end
  # ここまで追加25章
end
