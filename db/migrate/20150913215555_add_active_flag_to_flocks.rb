class AddActiveFlagToFlocks < ActiveRecord::Migration
  def change
    add_column :flocks, :active, :boolean, default: true
  end
end
