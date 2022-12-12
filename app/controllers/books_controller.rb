class BooksController < ApplicationController
  def new
      if params[:keyword]
        @books = RakutenWebService::Books::Book.search(title: params[:keyword])
      end
  end
end
