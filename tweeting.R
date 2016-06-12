tweet <- function(poem) { 
  library(twitteR)
  
  consumer_key = "caY0hvkvH8sb7HzPojUkTrjw1"
  consumer_secret = "HqXoDX9qqgsxgDD0mjA2V3lO2ao7gp0m5vkINaQTBOfHmaMkmW"
  access_token = "741928314323996672-IPmVPxhj1CGFHUNXCCWKmPtJuJ4RPBX"
  access_secret = "QC8fHWCfPvQHtNvS1ub0homvtiMJiR0lQbwp2ezC6YD82"
  setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
  
  msg = tweet(poem)
  }
