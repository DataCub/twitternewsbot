# source file for text 
source("/Users/yashtekriwal/Desktop/iXperience/Projects/TwitterProject/yash_script.R")
source("/Users/yashtekriwal/Desktop/iXperience/Projects/TwitterProject/TribbyTextGenerate.R")

# get text 
text <- get_text()

# get poem 
poem <- generate_poem(text)

# send it to twitter 
library(twitteR)
library(base64enc)
library(httr)

consumer_key <- "tk3GAuZryfHFWZ65x4Rxgx1Rh"
consumer_secret <- "XEbnvr3BsPxbVaLohMYbohSYhDPpC5KKypgQbsf7VvQtLF4RGP"
access_token <- "741928314323996672-pcMtgEWBfQQEhVk2fNLJ03yibmglsFr"
access_secret <- "twXwPVTyvvKQbBQPKWI4avbJRKmMdQnSmO1USdJap0sLJ"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

while (nchar(poem) > 140) {
  poem <- generate_poem(text)
}
tweet(poem)

quit(save = "no")
