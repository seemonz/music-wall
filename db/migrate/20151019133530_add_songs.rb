class AddSongs < ActiveRecord::Migration
  def change
    create_table "songs", force: true do |t|
      t.string "track"
      t.string "artist"
      t.string "url"
      t.date "created_at"
    end
  end
end
