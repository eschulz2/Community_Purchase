class PurchaseForTables < ActiveRecord::Migration
  def change
  	add_column :tables, :purchased, :boolean, default: false
  end
end
