class DropDefaultFromRuns < ActiveRecord::Migration
  def change
    change_column_default(:runs, :washed, nil)
  end
end
