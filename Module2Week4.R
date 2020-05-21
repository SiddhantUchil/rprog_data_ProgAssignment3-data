dir()
read.csv("hospital-data.csv")
main = read.csv("hospital-data.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
str(main)
head(main)
main2=read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
head(main2)
task1 = main2[ ,11]
hist(task1)

library(dplyr)


best = function(state1, outcome){
  
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
  
  sortedfile
  
}


best("TX", "heart attack")


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
  
  b <<- sortedfile
  
  {
    if(num == "best"){
      b = b[1, "hospital"]
    } else if(num == "worst"){
        c = nrow(b)
        b = b[c, "hospital"]
      }
      else{
      b = b[num, "hospital"]
    }
  }
  b
}

rankhospital("TX", "heart failure", "worst")



a = data.frame(main2[, c(2,7,11,13,17)])
colnames(a) = c("hospital", "state", "attack","failure", "pneumonia")
str(a)
s = split.data.frame(a, a$state)
count(s)
c = split(a, a$state, drop = TRUE)
b = as.data.frame(unlist(c[1]))
b
h = c[1]
h
f = matrix(unlist(h), ncol = 5, byrow = FALSE)
f

rankall = function(outome1, num){
  file1 = main2[, c(2,7,11,13,17)]
  colnames(file1) = c("hospital", "state", "attack","failure", "pneumonia")
  
  {
  if (outcome1 == "heart attack"){
    file2 = file1[,c(1,2,3)]
  } else if (outome1 == "heart failure"){
    file2 = file1[, c(1,2,4)]
  } else {
    file2 = file1[, c(1,2,5)]
  }
  }
  
  file3 = na.omit(file2)
  
  colnames(file3) = c("hospital", "state", "outcome")
  
  file3 = arrange(file3, outcome, state)
  
  
}


best("SC", "heart attack")
best("NY", "pneumonia")

best("AK", "pneumonia")
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)


















