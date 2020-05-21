dir()
read.csv("hospital-data.csv")
main = read.csv("hospital-data.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
str(main)
head(main)
main2=read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
library(dplyr)

rankhospital = function(state1, outcome, num){
  
  main2
  file1 = main2[,c(2,7,11,17,23)]
  names(file1) = c("hospital","state","attack","failure", "pneumonia")
  
  file2 = split(file1, file1$state)
  file3 = data.frame(file2[state1])
  
  if(outcome == "heart attack"){
    file3 = file3[, c(1,2,3)]
  } else if (outcome == "heart failure"){
    file3 = file3[, c(1,2,4)]
  } else {
    file3 = file3[, c(1,2,5)]
  }
  
  file3 = na.omit(file3)
  
  names(file3) = c("hospital", "state", "outcome")
  
  sortedfile <<- arrange(file3, outcome, hospital)
  
  b = sortedfile
  
  
  
  if(num = "best"){
    b[1,"hospital"]
  } else if(num = "worst"){
    b[nrow(b),"hospital"]
  } else {
    b[num, "hospital"]
  }
  
}