class User < ActiveRecord::Base
  has_many :songs

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8}
  
end