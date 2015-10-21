class AddUpvoteTable < ActiveRecord::Migration
  def change
    create_table "upvotes" do |t|
      t.integer "user_id"
      t.integer "song_id"
      t.integer "score", default: 0
    end
  end
end
