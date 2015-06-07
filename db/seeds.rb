require "csv"

CSV.foreach Rails.root.join("db", "seeds", "shows.csv"), headers: true do |row|
  Show.create(rovi_id: row[0], title: row[1], description: row[2], genre: row[3], img_link: row[4], trailer_link: row[5], rating: row[6], duration: row[7])
end

CSV.foreach Rails.root.join("db", "seeds", "reactions.csv"), headers: true do |row|
  Reaction.create(reaction: row[0], reaction_type: row[1], user_id: row[2], show_id: row[3])
end