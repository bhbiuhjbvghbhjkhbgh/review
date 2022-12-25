class UsersController < ApplicationController
  def show
    @user = current_user
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
     @user = User.find(params[:id])
     @user.update(user_params)
     redirect_to user_path(current_user)
  end



  private

  def user_params
    params.require(:user).permit(:nickname, :date_of_birth, :sex, :image)
  end
end