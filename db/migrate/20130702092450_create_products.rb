class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :id
      t.string :name
      t.integer :category_id
      t.text :description
      t.string :image
      t.float :price_value
      t.string :price_currency
      t.float :review_rate
      t.integer :review_count

      t.timestamps
    end
  end
end
