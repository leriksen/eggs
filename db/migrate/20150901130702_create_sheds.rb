class CreateSheds < ActiveRecord::Migration
  def change
    create_table :sheds do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
