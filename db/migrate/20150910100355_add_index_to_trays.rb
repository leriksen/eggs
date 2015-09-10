class AddIndexToTrays < ActiveRecord::Migration
  def change
    add_index :trays, :created_at
  end
end
