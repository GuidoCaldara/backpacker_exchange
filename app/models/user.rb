class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :username, :dob, :place, presence: true, on: :update
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, PhotoUploader
  has_many :items, dependent: :destroy
  has_many :favourites, dependent: :destroy
  before_validation :email_downcase
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validate :password_complexity


  def email_downcase
    email = email.strip.downcase if email
  end

  def password_complexity
    if !password.nil? && password !~ /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/
      errors.add :password, 'Password must include at least one lowercase letter, one uppercase letter, and one digit'
    end
  end

end
