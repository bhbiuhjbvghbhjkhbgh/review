class AddBookIdToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :book_id, :integer
  end
end
