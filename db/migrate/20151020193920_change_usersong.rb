class ChangeUsersong < ActiveRecord::Migration
  def change
    change_table "songs" do |t|
      t.integer "user_id"
    end
  end
end
