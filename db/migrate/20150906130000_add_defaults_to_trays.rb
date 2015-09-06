class AddDefaultsToTrays < ActiveRecord::Migration
  def change
    change_column :trays, :washed, :integer, default: 0
    change_column :trays, :waste, :integer, default: 0
  end
end
