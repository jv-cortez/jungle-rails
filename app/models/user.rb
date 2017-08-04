class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, 
            :last_name, presence: true
  validates :email, presence: true, 
                    uniqueness: true
  validates :password, presence: true 
  #custom validation for password wtih p confirmation

end
