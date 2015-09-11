class RenameWashedToStandardForRuns < ActiveRecord::Migration
  def change
    rename_column :runs, :washed, :standard
  end
end
