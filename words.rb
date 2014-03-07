require "csv"

CSV.open("out.csv").each do |row|
  unless row[8]
    puts row[0]
  end
end