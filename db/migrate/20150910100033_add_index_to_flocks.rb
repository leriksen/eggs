class AddIndexToFlocks < ActiveRecord::Migration
  def change
    add_index :flocks, :created_at
  end
end
