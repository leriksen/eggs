class CreateTrayTypes < ActiveRecord::Migration
  def change
    create_table :tray_types do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
