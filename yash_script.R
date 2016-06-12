get_text <- function() {

library(rtimes)

#key 
key <- "610101c594e74e9b9e9660118c7710cd"

#put the dates in generic format 
today <- Sys.Date()
today <- gsub("(-)*", "", today)
yesterday <- as.character(as.numeric(today) - 00000001)

#grab data from the Article Search API using rtimes 
out <- as_search(q = "", begin_date = yesterday, end_date = today, key = key) 

all_articles <- out$data[1:length(out$data)]


# grabbing URL 
all_URLS <- c()
for (i in 1:length(out$data)){
  change_to_text <- as.character(all_articles[[i]])
  URL <- change_to_text[1]
  all_URLS <- append(all_URLS, URL, after = 1)
}

# scraping URL 
library(rvest)
library(dplyr)
library(RSelenium)
}


  

