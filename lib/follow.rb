require 'twitter'
require 'dotenv'# Appelle la gem Dotenv
require 'pry'

Dotenv.load('.env')


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

users_twitter =[]

client.search("#bonjour_monde", result_type: "recent").take(140).each do |tweet|
  users_twitter << tweet.user.name
end

  puts users_twitter.uniq

  client.follow(users_twitter.uniq)
