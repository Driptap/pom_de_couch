class CreateSwipes < ActiveRecord::Migration
  def change
    create_table :swipes do |t|
      t.integer :user_id
      t.integer :show_id
      t.string :state

      t.timestamps
    end
  end
end
