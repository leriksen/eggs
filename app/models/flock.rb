class Flock < ActiveRecord::Base
  has_many :runs

  validates :name,  presence: true,
                    length: {within: (2..255)},
                    uniqueness: {case_sensitive: true}

  def to_s
    name
  end
end
