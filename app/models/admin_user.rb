class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  attr_writer :login

  validate :validate_nickname
  def login
    @login || email || nickname
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase}]).first
    elsif conditions.has_key?(:nickname) || conditions.has_key?(:email)
    end
  end

  def validate_nickname
    if AdminUser.where(email: nickname).exists?
      errors.add(:nickname, :invalid)
    end
  end
end
