class CreateRunTypes < ActiveRecord::Migration
  def change
    create_table :run_types do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
