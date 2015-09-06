class Shed < ActiveRecord::Base
  has_many :trays

  validates :name,  presence: true,
                    length: {within: (2..255)},
                    uniqueness: {case_sensitive: true}

end
