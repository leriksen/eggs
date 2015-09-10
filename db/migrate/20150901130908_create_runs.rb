class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :washed
      t.integer :waste
      t.references :flock, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
