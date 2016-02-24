class AddDateToTables < ActiveRecord::Migration
  def change
  	add_column :tables, :datetime, :datetime
  end
end
