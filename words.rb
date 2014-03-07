require "csv"

CSV.open("out.csv").each do |row|
  if row[8] == "true"
    puts row[0]
  end
end