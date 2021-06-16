class User < ApplicationRecord
  after_validation :set_slug, only: [:create,:update]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  validate :validate_firstname
  enum language: [:fr, :en, :es]
  def login
    @login || firstname || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(firstname) = :value OR lower(email) = :value", { :value => login.downcase}]).first
    elsif conditions.has_key?(:firstname) || conditions.has_key?(:email)
    end
  end

  def validate_firstname
    if User.where(email: firstname).exists?
      errors.add(:firstname, :invalid)
    end
  end

  validates :firstname, :lastname, presence: true
  def to_param
    "#{id}-#{firstname}-#{lastname}"
  end

  private

  def set_slug
    fullname = "#{id}-#{firstname}-#{lastname}"
    self.slug = fullname.to_s.parameterize
  end
end
