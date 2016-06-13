get_article <- function() {

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

article_number <- sample(1:length(all_URLS), 1)
all_URLS[[article_number]]
}

get_text <- function(article){

library(rvest)
library(dplyr)
library(RSelenium)
library(stringr)

page <- read_html(article)
words <- page %>% html_nodes("div > p") %>% html_text()

# trimming words 
trimmed_vec <- str_trim(words)
trimmed_vec <- trimmed_vec[trimmed_vec != ""]

all_words <- sapply(trimmed_vec, paste0)
  
}





  

