class CreateCartitems < ActiveRecord::Migration
  def change
    create_table :cartitems do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
