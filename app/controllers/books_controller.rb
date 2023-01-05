class BooksController < ApplicationController
  def new
    @user = current_user
    @books = []
    begin
       if params[:keyword].present?

        results = RakutenWebService::Books::Book.search(title: params[:keyword])

        results.each do |result|
          book = Book.new(read(result))
          @books << book
        end
       end
       #byebug
    rescue StandardError => e
         #logger.info "エラーが発生"
         redirect_to new_book_path, alert: e.message
    end

    @books.each do |book|

      unless Book.all.include?(book)
        book.save
      end
      #byebug
    end

  end

  def show
      @book = Book.find_by(isbn: params[:id])
      @post = Post.new
      @posts = @book.posts

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @book = Book.find_by(isbn: params[:post][:book_isbn])
    @post.book = @book

    if @post.save
      redirect_to root_path
    else
      render 'books/new'
    end
  end

  def bookmark

    @book = Book.find_by(isbn: params[:book_isbn])
    bookmark = @book.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to user_path(current_user)
    else
      render 'books/new'
    end
  end
  def destroy
    @book = Book.find_by(isbn: params[:book_isbn])
    bookmark = @book.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
      bookmark.destroy
      redirect_to user_path(current_user)
    else
      render 'books/new'
    end
  end






  private

  def post_params
    params.require(:post).permit(:user_id, :book_id, :star, :comment)
    # params.permit(:user_id, :book_id, :star, :comment)
  end

  def book_params
      params.permit(:title, :sales_date, :author, :item_price, :item_url, :small_image_url, :medium_image_url, :large_image_url, :item_number, :isbn, :post_id, :user_id)
  end

  def read(result)
    title = result["title"]
    author = result["author"]
    item_url = result["itemUrl"]
    isbn = result["isbn"]
    item_caption = result["itemCaption"]
    publisher_name = result["publisherName"]
    small_image_url = result["smallImageUrl"]
    item_price = result["itemPrice"]

    {
      title: title,
      author: author,
      item_url: item_url,
      isbn: isbn,
      small_image_url: small_image_url,
      publisher_name: publisher_name,
      item_caption: item_caption,
      item_price: item_price,
    }
  end


end
