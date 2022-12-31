class BookmarksController < ApplicationController
  def bookmark
    @book = Book.find_by(isbn: params[:book_isbn])
    bookmark = @book.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to user_path(current_user)
    else
      render 'books/new'
    end
  end
end
