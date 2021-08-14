class User < ApplicationRecord
  has_many :hotels, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :password_confirmation, presence: true

  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:password_confirmation].blank? 
      params.delete(:password)
      params.delete(:password_confirmation)
    end
      
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      password = SecureRandom.urlsafe_base64(8)
      user.password = password
      user.password_confirmation = password
      user.name = "GuestUser"
    end
  end
end
