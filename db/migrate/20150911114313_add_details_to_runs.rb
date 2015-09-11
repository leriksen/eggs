class AddDetailsToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :delivered, :integer
    add_column :runs, :seconds, :integer
    add_column :runs, :jumbo, :integer
  end
end
