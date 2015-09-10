class Run < ActiveRecord::Base
  belongs_to :flock
  belongs_to :user
  belongs_to :run_type

  validates :washed, numericality: {
                                      only_integer: true,
                                      greater_than_or_equal_to: 0
                                    }
  
  validates :waste, numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 0
                                  }
end
