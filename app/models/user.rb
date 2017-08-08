class User < ActiveRecord::Base

  
  has_secure_password
  validates :first_name, 
            :last_name, presence: true
  validates :email, presence: true 
  validates :email, uniqueness: true
  validates :password, presence: true 
  validates :password, length: { minimum: 6 }, on: :create 

  #custom validation for password wtih p confirmation

  def self.authenticate_with_credentials(email, password)
    # @user ||= User.find(params[:email], [:password]) if params([:email], [:password])
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user 
    else
      nil
    end
  end
end
