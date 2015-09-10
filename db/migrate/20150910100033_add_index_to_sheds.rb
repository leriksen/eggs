class AddIndexToSheds < ActiveRecord::Migration
  def change
    add_index :sheds, :created_at
  end
end
