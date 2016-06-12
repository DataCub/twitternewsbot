library(stringr)

#Text Preparation
#Formatting the text 
text <- tolower(text)
text <- str_replace_all(text, " i ", " I ")
text <- str_replace_all(text, "\n", "")
text <- str_replace_all(text, "[.]", "")
text <- str_replace_all(text, "[?]", "")
text <- str_replace_all(text, "  ", " ")

#Splitting each word into an element of a vector
split <- str_split(text, " ")[[1]]

env <- new.env()

#Creating a word list which will be used later to pick the first word
word_list <- vector(mode = "character", length = 0)


for(i in 1:(length(split) - 1)){
  
  #Adds unique words to the word list
  if(!split[i]%in%word_list){
    word_list[length(word_list) + 1] <- split[i]
  }
  
  #The rest of the for loop adds each word in the text to the environment using the
  #word as the key and the words that follow as the values
  index <- length(env[[split[i]]])
  
  if(index > 0){
    env[[split[i]]][index + 1] <- split[i+1]
  }
  else{
    env[[split[i]]] <- split[i + 1]
  }
}

#Handles the last word in the text and addresses a possible edge case
if(!split[length(split)]%in%word_list){
  word_list[length(word_list) + 1] <- split[length(split)]
}
env[[split[length(split)]]] <- "There is no next word"

#Random Sentence Generation

#empty vector which will hold every word for the output
output <- vector(mode = "character", length = 0)

#limit on the number of characters for the output to have
limit <- sample(30:120, 1)

#Deciding the first word using the wordlist and a random index
start_index <- sample(1:length(word_list), 1)
word <- word_list[start_index]
text_length <- nchar(word)
output[1] <- word

#boolean to control the while loop
not_finished = TRUE

while(not_finished){
  
  if(text_length > limit & word %in% nouns){
    not_finished = FALSE
  }else{
    #Picks the next word using a random index
    index <- sample(1:length(env[[word]]), 1)
    next_word <- env[[word]][index] 
    
    #Addresses an edge case because the last word will not have any words following it
    if(next_word == "There is no next word"){
      not_finished = FALSE
    }
    else{
      #Adds the new word to the output vector and updates variables
      output[length(output) + 1] <- next_word
      word <- next_word
      text_length <- text_length + nchar(word) + 1
    }
  }
}

#Creates a string from the output vector and prints it out
tweet <- str_c(output, collapse = " ")
print(tweet)
