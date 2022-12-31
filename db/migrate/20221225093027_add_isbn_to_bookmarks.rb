class AddIsbnToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :isbn, :integer
  end
end
