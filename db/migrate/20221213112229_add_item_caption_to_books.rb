class AddItemCaptionToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :item_caption, :string
  end
end
