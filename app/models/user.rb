class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8}
  
end