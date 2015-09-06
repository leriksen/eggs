class TrayType < ActiveRecord::Base

  private

  # turn off STI
  def self.inheritance_column
    nil
  end
end
