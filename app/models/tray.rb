class Tray < ActiveRecord::Base
  belongs_to :shed
  belongs_to :user

  validates :washed, numericality: {
                                      only_integer: true,
                                      greater_than_or_equal_to: 0
                                    }
  
  validates :waste, numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 0
                    }
end
