class AddPublisherNameToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :publisher_name, :string
  end
end
