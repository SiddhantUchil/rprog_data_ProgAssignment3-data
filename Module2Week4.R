dir()
read.csv("hospital-data.csv")
main = read.csv("hospital-data.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
str(main)
head(main)
main2=read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
head(main2)
task1 = main2[ ,11]
hist(task1)

