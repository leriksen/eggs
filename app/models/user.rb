class User < ActiveRecord::Base
  has_secure_password

  has_many :trays
  
  validates :first_name, presence: true, length: {within: (2..20)}
  validates :last_name, presence: true, length: {within: (2..20)}
  validates :password, presence: true, length: {within: (6..255)}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true, email: true

  before_save { self.email = email.downcase }
  
  def to_s
    "#{first_name} #{last_name}"
  end
end
