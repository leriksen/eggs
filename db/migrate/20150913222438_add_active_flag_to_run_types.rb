class AddActiveFlagToRunTypes < ActiveRecord::Migration
  def change
    add_column :run_types, :active, :boolean, default:true
  end
end
