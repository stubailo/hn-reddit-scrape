require "date"
require "json"
require "csv"

CSV.open("out.csv", "wb") do |csv|
  csv << ["Title", "Link", "Rank", "Score", "User", "Time", "Source", "Date Scraped", "Reddit?"]

  Dir.foreach("json") do |name|
    unless name.start_with? "."
      if name.split("-")[4] == "00"
        File.open("json/" + name) do |f|
          date = name.split("_")[0]
          date = DateTime.strptime(date + " UTC", "%Y-%m-%d-%H-%M-%S %Z").to_time.to_i

          data = JSON.load(f)

          if name.split("_")[1] == "r"
            is_reddit = true
            source = name.split("_")[2].split(".")[0]

            posts = data["data"]["children"]

            posts.each_with_index do |item, index|
              post_data = item["data"]

              title = post_data["title"]
              link = post_data["url"]
              rank = index + 1
              score = post_data["score"]
              user = post_data["author"]
              time = post_data["created_utc"]

              csv << [title, link, rank, score, user, time, source, date, is_reddit]
            end
          else
            is_reddit = false
            source = name.split("_")[1].split(".")[0]

            data.each do |item|
              title = item["title"]
              link = item["link"]
              rank = item["rank"]
              score = item["score"]
              user = item["user"]
              time = DateTime.strptime(item["time"]+" UTC", "%Y-%m-%d-%H%M%S %Z").to_time.to_i

              csv << [title, link, rank, score, user, time, source, date, is_reddit]
            end
          end
        end
      end
    end
  end
end