library(rtimes)

#key 
key <- "610101c594e74e9b9e9660118c7710cd"

#put the dates in generic format 
today <- Sys.Date()
today <- gsub("(-)*", "", today)
yesterday <- as.character(as.numeric(today) - 00000001)

#grab data from the Article Search API using rtimes 
out <- as_search(q = "news", begin_date = yesterday, end_date = today, key = key) 

all_articles <- out$data[1:length(out$data)]

#grabbing just the headlines and making one character string 
text <- ""
for (i in 1:length(out$data))
{ 
  change_to_text <- as.character(all_articles[[i]])
  result <- change_to_text[2]
  text <- paste(text, result)
}
text <- gsub("(^\\s)", "", text)



