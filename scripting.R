# read in functions 
source(file = "yash_script.R")
source(file = "TribbyTextGenerate.R")
source(file = "tweeting.R")

# grab the text 
text <- get_text()

# generate the poem 
poem <- generate_poem(text)

# send it to twitter 
library(twitteR)
library(base64enc)
library(httr)

consumer_key <- "q2BZQghCoHtBIHus9DCUzIlXS"
consumer_secret <- "IS5uHBUJZRQfRZFrpsHWT67I0yerAJWOjc6zhe8qG8Q1CNqaxa"
access_token <- "741928314323996672-xvqmP4z6rGZLmBNdbrfi1zMc86SAwj5"
access_secret <- "z6WOaRa4YeTODwaFvb8E9x5ap8iI4FDVS7iIk97QU28Q8"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweet(poem)

quit(save = "no")
