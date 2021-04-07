class User < ApplicationRecord
  after_validation :set_slug, only: [:create,:update]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  def login
    @login || lastname || email
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
