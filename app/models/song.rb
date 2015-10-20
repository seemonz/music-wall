class Song < ActiveRecord::Base
  belongs_to :user

  validates :artist, presence: true
  validates :track, presence: true
  validates :url, presence: true

end
