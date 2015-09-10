class AddDefaultsToRuns < ActiveRecord::Migration
  def change
    change_column :runs, :washed, :integer, default: 0
    change_column :runs, :waste, :integer, default: 0
  end
end
