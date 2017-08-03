class User < ActiveRecord::Base

  validates: :name, :email, :password_digest, presence: true
  #validates: :password_digest, presence: true
end
