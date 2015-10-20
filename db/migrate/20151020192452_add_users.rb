class AddUsers < ActiveRecord::Migration
  def change
    create_table "users" do |t|
      t.string "user_name"
      t.string "email"
      t.string "password"
      t.date "created_at"
    end
  end
end
