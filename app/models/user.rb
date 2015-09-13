class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :remember_token

  has_many :runs
  
  scope :active, -> {where(active: true)}
  scope :inactive, -> {where(active: false)}

  validates :first_name, presence: true,  length:     {within: (2..20)}
  validates :last_name,  presence: true,  length:     {within: (2..20)}
  validates :password,   presence: true,  length:     {within: (6..255)}
  validates :email,      presence: true,  length:     {maximum: 255},
                                          uniqueness: {case_sensitive: false},
                                          email: true

  before_save { self.email = email.downcase }

  def to_s
    "#{first_name} #{last_name}"
  end

  def remember
    self.remember_token = self.class.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(param_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(param_token).is_password? remember_token
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

      BCrypt::Password.create(string, cost: cost)
    end
  end
end
