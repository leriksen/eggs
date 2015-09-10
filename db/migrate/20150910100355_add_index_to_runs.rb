class AddIndexToRuns < ActiveRecord::Migration
  def change
    add_index :runs, :created_at
  end
end
