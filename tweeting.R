
library(lubridate)

forever = TRUE
while(forever){ 
#Yash's function, got to make this a function
text <- get_text()
#Matt's function
generate_text(text)
#Delay
Sys.sleep(60*60*2)
}
