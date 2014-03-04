require "rubygems"
require "ruby-hackernews"
require "json"
include RubyHackernews

time = Time.now
posts = Array.new
Entry.all(5).each do |entry|
  #This is in here because some of the post have fucked up timestamps, just ignore those mofos
  begin
    posts << {title: entry.link.title, link: entry.link.href, rank: entry.number, score: entry.voting.score, user: entry.user.name, time: entry.time.strftime("%Y-%m-%d-%H%M%S")}
  rescue
  end
end
File.open([time.strftime("%Y-%m-%d-%H-%M-%S"),"hackernews.json"].join("_"),"w") do |json|
  json.write JSON.pretty_generate(posts)
end
