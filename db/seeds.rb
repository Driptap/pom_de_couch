require "csv"

CSV.foreach Rails.root.join("db", "seeds", "shows.csv"), headers: true do |row|
  Show.create(rovi_id: row[0], title: row[1], description: "This is a description", genre: row[3], img_link: row[4], trailer_link: row[5])
end
