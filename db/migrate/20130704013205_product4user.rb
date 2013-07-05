class Product4user < ActiveRecord::Migration
  def change
    add_column :products, :postuserid, :integer
  end
end
