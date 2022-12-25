class AddPostIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :post_id, :integer
  end
end
