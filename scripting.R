# read in functions 
source(file = "yash_script.R")
source(file = "TribbyTextGenerate.R")
source(file = "tweeting.R")

# grab the text 
text <- get_text()

# generate the poem 
poem <- generate_poem(text)

# send it to twitter 
tweet(poem)

quit(save = "no")
