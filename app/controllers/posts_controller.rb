class PostsController < ApplicationController
  def new
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to new_post_path
    else
      render 'books/new'
    end
  end

  private

  def post_params
      params.require(:post).permit(:user_id, :book_id, :star)
  end
end
