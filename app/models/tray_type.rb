class TrayType < ActiveRecord::Base
  has_many :trays
  
  private

  # turn off STI
  def self.inheritance_column
    nil
  end
end
