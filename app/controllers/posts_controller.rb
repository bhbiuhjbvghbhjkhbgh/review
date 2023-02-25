class PostsController < ApplicationController
  def new
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user)
    else
      @user = current_user
      render 'books/new'
    end
  end

  private

  def post_params
      params.permit(:user_id, :book_id, :star)
  end
end
