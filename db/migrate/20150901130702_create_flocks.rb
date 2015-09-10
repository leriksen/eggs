class CreateFlocks < ActiveRecord::Migration
  def change
    create_table :flocks do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
