cd /home/admin/scrape/hn-reddit-scrape
ruby hn.rb
ruby reddit.rb
aws s3 sync . s3://c4r-scrape
