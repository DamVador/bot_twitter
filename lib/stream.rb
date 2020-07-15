require 'twitter'
require 'dotenv'# Appelle la gem Dotenv
require 'pry'

Dotenv.load('.env')

rClient = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

sClient = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end


sClient.filter(track: "#bonjour_monde") do |tweet|
  if tweet.is_a?(Twitter::Tweet)
    rClient.favorite(tweet)
    rClient.follow(tweet.user)
    puts tweet.text
    puts tweet.user.name
  end
end
