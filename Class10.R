library(stringr)

#dealing with text based data (ie emails, twitter, etc)

#1. Create a character string that contains just one quotation mark: "

print("DSO")

print("\"")
 #\ (back-slash) is an "escape" character in R. 

#solution
cat("\"")

#print on separate lines, n represents new line, t represents tab
cat("DSO\n545")
cat("DSO\t545")


#2. Create the following: :-\, (^_^"), @_'-', \m/
#only need to use escape characters when you are using characters R uses in typical code
#need to use \ to escape \ that want to be printed

cat(":-\\")

cat("(^_^\")")

cat("@_'-'")

cat("\\m/")


#3. Load stringr R pacakge, and search for str_locate() and str_sub()

?str_locate
?str_sub

#4. Locate the character "a" in "great", "fantastic", and "super"

str_locate(string = "great", "a")
str_locate(string = "fantastic", "a")   #only tells you where the first instance is
str_locate_all(string = "fantastic", "a")
str_locate(string = "super", "a")

str_locate_all(c("fantastic","great","super"), pattern = "a")

#5. Extract the substrings "tes", "ting", and "test", from "testing"

str_sub(string = "testing", start = 1, end = 3)
str_sub(string = "testing", start = 4, end = 7)
str_sub(string = "testing", start = 1, end = 4)

#if you do not specify the end, it will go to the end of the string that it is looking at
#if you just specify at the end, it will start at the beginning of the string
str_sub("testing", end = 4)

#answering the wrong question, key word was "extract"
str_locate("testing", "tes")
str_locate("testing", "ting")
str_locate("testing", "test")

str_locate("testing", c("tes", "ting", "test"))

#6. What is this code doing? input = c("abc", "defg"), str_sub(input, c(2,3))

input = c("abc", "defg")
str_sub(input, c(2,3))
#starts at the 2nd value in the first variable and the 3rd value in the second variable in the vector

#7. Use str_locate() to identify the location of the blank line that seperates the header from the body
  #in the first email. (Hint: a blank line is a newline immediately followed by another newline)

#Note: did not need to set a working directory because we are using projects
emails = readRDS("email.rds")

cat(emails[2])

#do not need escape character because it is looking through the text file, not printing
str_locate(emails[1], "\n\n")

#8. Extract the header and body for the first email.

header = str_sub(emails[1], end = 842)
body = str_sub(emails[1], start = 843)

cat(body)

#9. Split the header of the first email message into its corresponding metadata. (Hint, each part of the 
  #metadata is on a seperate line. Look for str_split())



#10. Extract the header and body for all email messages. Store the header and body in header and body
  #variables respectively.

breaks = str_locate(emails, "\n\n")

header = str_sub(emails, end = breaks[,1])

body = str_sub(emails, start = breaks[,2])

cat(body[3])

### Regular expressions in R

#1. Create the following vector of strings in R:

fruit = c("apple", "banana", "pear", "pineapple")

#2. Run the following lines of code and try to understand what's happening

str_detect(fruit, "a")
#is a present in the elements in the vector. Returns true or false

str_detect(fruit, "^a")
#starts with a

str_detect(fruit, "a$")
#ends with a

str_detect(fruit, "[aeiou]")
#square brackets represent an or (a or e or i or o or u)

str_detect(fruit, "[a-d]")
#the dash represents a thru d (a or b or c or d)

#3. Using regular expressions, write down a line of R code to detect which of the fruits starts with an "a"
  #and ends with an "e". The following table might help: (see lab print out)

str_detect(fruit, "^a[a-z]*e$")

#another solution
str_detect(fruit, "^a.*e$")
#. represents any character numberical or alphabetical

#4. Create a parser that detects phone numbers of this format 213 740 4826

phone = c("213 740 4826", "213-740-4826", "(213) 740 4826")

str_detect(phone, "[(]?[0-9]{3}[)]?[ -][0-9]{3}[ -][0-9]{4}") #called a parser

#5. How are phone numbers formatted? Look at the body of messages 10 and 18 in the emails dataset.
  #Create a parser that detects those formats of phone numbers.

str_extract_all(body, "[(]?[0-9]{3}[)]?[ -][0-9]{3}[ -][0-9]{4}")

#6. Create a parser that detects zip codes.




