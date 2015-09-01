class User < ActiveRecord::Base
  has_secure_password

  has_many :trays
  
  validates :first_name, presence:   true
  validates :last_name , presence:   true
  validates :password  , presence:   true
  validates :email     , presence:   true,
                         uniqueness: true,
                         email:      true

  def to_s
    "#{first_name} #{last_name}"
  end
end
