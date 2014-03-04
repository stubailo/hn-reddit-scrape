require "open-uri"

subreddits = [
  "all",
  "programming",
  "startups",
  "webdev",
  "web_design",
  "javascript",
  "php",
  "ruby",
  "python",
  "entrepreneur",
  "hwstartups",
  "bitcoin",
  "siliconvalley"
]

subreddits.each do |subreddit|
  puts "opening #{subreddit}"
  text = open("http://reddit.com/r/#{subreddit}/hot.json",
    "User-Agent" => "History by tofueggplant"
  ).read;

  puts "writing #{subreddit}"
  File.open(Time.now.strftime("%Y-%m-%d-%H-%M-%S_r_#{subreddit}.json"), "w") do |f|
    f.write(text)
  end

  sleep(2)
end