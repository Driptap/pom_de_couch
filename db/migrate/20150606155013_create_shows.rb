class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :rovi_id
      t.string :title
      t.string :description
      t.string :genre
      t.string :img_link
      t.string :trailer_link

      t.timestamps
    end
  end
end
