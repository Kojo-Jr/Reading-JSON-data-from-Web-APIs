# Read JSON data from web APIs Using R

# load the package
library(httr)

# call the URl using the get function / method
wordInfo <- GET("https://api.dictionaryapi.dev/api/v2/entries/en/geek")
wordInfo

# to get the content out of it, we need jsonlite and rawtochar
# load the package
library(jsonlite)

# to convert we need rawtoChar
content <- rawToChar(wordInfo$content)
content

# convert to get cleaner format
data <- fromJSON(content)
data

# to extract the meanings
meanings <- data$meanings

# it is a list so we can use this:
meanings[[1]][[2]][[1]]$definition


# we can also play with strings

# storing search query in a variable
word <- "delicious"

# append the query at the end
wordInf <- GET(paste("https://api.dictionaryapi.dev/api/v2/entries/en/geek", word))

data <- fromJSON(rawToChar(wordInf$content)) 

data$meanings[[1]][[2]][[1]]$definition
