generate_poem <- function(text){
  
  library(stringr)
  library(tm)
  nouns <- as.vector(read.table("/Users/yashtekriwal/Desktop/iXperience/Projects/TwitterProject/nounlist.txt")$V1)
  
  #Text Preparation
  #Formatting the text 
  text <- tolower(text)
  text <- removeNumbers(text)
  text <- removePunctuation(text)
  text <- stripWhitespace(text)
  text <- str_replace_all(text, " i ", " I ")
  text <- str_trim(text)
  text <- paste0(text[1:length(text)], collapse = " ")

  
  #Splitting each word into an element of a vector
  split <- str_split(text, " ")
  
  env <- new.env()
  
  #Creating a word list which will be used later to pick the first word
  word_list <- vector(mode = "character", length = 0)
  
  
  for(i in 1:(length(split) - 3)){
    
    #Adds unique words to the word list
    if(!split[i] %in% word_list & split[i]%in%nouns){
      word_list[length(word_list) + 1] <- split[i]
    }
    
    #The rest of the for loop adds each word in the text to the environment using the
    #word as the key and the words that follow as the values
    index <- length(env[[split[i]]])
    
    if(index > 0){
      env[[split[i]]][index + 1] <- str_c(split[i+1], split[i+2], split[i+3], sep = " ")
    }
    else{
      env[[split[i]]] <- str_c(split[i+1], split[i+2], split[i+3], sep = " ")
    }
  }
  
  #Handles the last word in the text and addresses a possible edge case
  env[[split[length(split)]]] <- "There is no next word"
  
  #Random Sentence Generation
  
  #empty vector which will hold every word for the output
  output <- vector(mode = "character", length = 0)
  
  #Deciding the first word using the wordlist and a random index
  start_index <- sample(1:length(word_list)-1, 1)
  word <- word_list[start_index]
  text_length <- nchar(word)
  output[1] <- word
  
  #boolean to control the while loop
  not_finished = TRUE
  
  while(not_finished){
    
    if(text_length > 40 & word %in% nouns){
      not_finished = FALSE
    }else{
      #Picks the next word using a random index
      index <- sample(1:length(env[[word]]), 1)
      next_word <- env[[word]][index] 
      
      if(next_word == "There is no next word"){
        nont_finished = FALSE
      }
      else{
        #Adds the new word to the output vector and updates variables
        output[length(output) + 1] <- next_word
        word <- str_split(next_word, " ")[[1]][3]
        text_length <- text_length + nchar(next_word) + 4
      }
    }
  }
  
  
  #Creates a string from the output vector and prints it out
  tweet <- str_c(output, collapse = " ")
  print(tweet)
  
}
