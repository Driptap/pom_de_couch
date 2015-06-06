class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.integer :user_id
      t.integer :show_id
      t.string :reaction_type
      t.string :reaction
      t.timestamps
    end
  end
end
