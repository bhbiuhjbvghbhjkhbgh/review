class BooksController < ApplicationController
  def new
      if params[:keyword]
        @bookes = RakutenWebService::Books::Book.search(title: params[:keyword])
      end
  end
end
