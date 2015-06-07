class AddRatingAndDurationToShows < ActiveRecord::Migration
  def change
    add_column :shows, :duration, :integer
    add_column :shows, :rating, :integer
  end
end
