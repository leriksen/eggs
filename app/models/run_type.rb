class RunType < ActiveRecord::Base
  has_many :runs
  
  private

  # turn off STI
  def self.inheritance_column
    nil
  end
end
