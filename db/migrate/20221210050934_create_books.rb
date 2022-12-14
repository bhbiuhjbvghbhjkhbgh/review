class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: false do |t|
      t.string :title
      t.bigint :item_number
      t.string :sales_date
      t.string :autor
      t.integer :item_price
      t.string :small_image_url
      t.string :medium_image_url
      t.string :large_image_url
      t.string :item_url
      t.bigint :isbn, null: false, primary_key: true

      t.timestamps
    end
  end
end
