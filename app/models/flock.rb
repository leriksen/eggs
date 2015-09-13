class Flock < ActiveRecord::Base
  has_many :runs

  scope :active, -> {where(active: true)}
  scope :inactive, -> {where(active: false)}

  validates :name,  presence: true,
                    length: {within: (2..255)},
                    uniqueness: {case_sensitive: true}

  def to_s
    name
  end
end
