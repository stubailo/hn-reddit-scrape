require "csv"

CSV.open("out.csv").each do |row|
  if row[8] == "true" and row[6] == "programming"
    puts row[0]
  end
end