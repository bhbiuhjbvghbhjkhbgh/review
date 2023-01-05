class UsersController < ApplicationController
  def show
    @user = current_user
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @book = Book.find_by(isbn: params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
     @user = User.find(params[:id])
     @user.update(user_params)
     redirect_to root_path
  end



  private

  def user_params
    params.require(:user).permit(:nickname, :date_of_birth, :sex, :image)
  end
end