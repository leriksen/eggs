class AddRunTypeRefToRuns < ActiveRecord::Migration
  def change
    add_reference :runs, :run_type, index: true, foreign_key: true
  end
end
