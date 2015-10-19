class Song < ActiveRecord::Base
  validates :artist, presence: true
  validates :track, presence: true
  validates :url, presence: true

end
