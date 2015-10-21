class Upvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

  # TODO: validations need to be done
  
end