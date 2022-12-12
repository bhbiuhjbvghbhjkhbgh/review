class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :comment
      t.float :star, null: false

      t.timestamps
    end
  end
end
