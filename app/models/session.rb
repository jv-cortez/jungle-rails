class Session < ActiveRecord::Base

  has_secure_password
  validates :email, presence: true, 
                    uniqueness: true
  validates :password, presence: true 
  #custom validation for password wtih p confirmation

end
