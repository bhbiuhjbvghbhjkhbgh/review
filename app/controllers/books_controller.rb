class BooksController < ApplicationController
  def new
    @books = []
    begin
       if params[:keyword].present?

        results = RakutenWebService::Books::Book.search(title: params[:keyword])

        results.each do |result|
          book = Book.new(read(result))
          @books << book
        end
       end
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
      @book = Book.find(params[:id])
  end


  private

  def book_params
      params.permit(:title, :sales_date, :author, :item_price, :item_url, :small_image_url, :medium_image_url, :large_image_url, :item_number, :isbn)
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
