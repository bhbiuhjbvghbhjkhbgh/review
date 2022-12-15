class BooksController < ApplicationController
  def new
      begin
         if params[:keyword].present?
          @bookes = RakutenWebService::Books::Book.search(title: params[:keyword])

         end
      rescue StandardError => e
           redirect_to new_books_path, alert: e.message
      end

  end
end
