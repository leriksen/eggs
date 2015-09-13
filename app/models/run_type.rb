class RunType < ActiveRecord::Base
  has_many :runs
  
  scope :active, -> {where(active: true)}
  scope :inactive, -> {where(active: false)}

  private

  # turn off STI
  def self.inheritance_column
    nil
  end
end
