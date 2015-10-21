class AddUpvoteToSong < ActiveRecord::Migration
  def change
    change_table "songs" do |t|
      t.integer "upvotes", default: 0
    end
  end
end
