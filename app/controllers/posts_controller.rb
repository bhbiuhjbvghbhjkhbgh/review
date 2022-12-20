class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to book_path(current_user)
    else
      render 'books/show'
    end
  end

  private

  def post_params
      params.require(:post).permit(:user_id, :book_id, :star)
  end
end
