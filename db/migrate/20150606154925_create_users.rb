class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :fb_uid
      t.string :fb_token
      t.string :fb_profile_picture

      t.timestamps
    end
  end
end
