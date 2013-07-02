class Yahoo < ActiveRecord::Migration
  def change
  	add_column :categories, :yahoocatid, "integer"
  end
end
