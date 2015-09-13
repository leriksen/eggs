class AddActiveFlagToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :active, :boolean, default: true
  end
end
