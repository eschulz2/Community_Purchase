class AddStuffToTables < ActiveRecord::Migration
  def change
  	add_column :tables, :location, :string
  	add_column :tables, :address, :string
  	add_column :tables, :description, :text
  	add_column :tables, :price, :integer
  end
end
