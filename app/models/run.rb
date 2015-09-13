class Run < ActiveRecord::Base
  belongs_to :flock
  belongs_to :user
  belongs_to :run_type

  scope :active, -> {where(active: true)}
  scope :inactive, -> {where(active: false)}

  validates :standard, numericality: {
                                      only_integer: true,
                                      greater_than_or_equal_to: 0
                                    }
  validates :waste, numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 0
                                  }
  validates :delivered, numericality: {
                                      only_integer: true,
                                      greater_than_or_equal_to: 0
                                    }
  validates :seconds, numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 0
                                  }
  validates :jumbo, numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 0
                                  }
end
