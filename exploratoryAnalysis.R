df<-read.csv('mkeAll.csv')
boxplot(df$allCrime6)
boxplot(df$allCrime7)
boxplot(df$allCrime8)
boxplot(df$allCrime9)
boxplot(df$allCrime10)
boxplot(df$allCrime11)
boxplot(df$allCrime12)
boxplot(df$allCrime13)
boxplot(df$allCrime14)
boxplot(df$allCrime15)
boxplot(df$allCrime16)
boxplot(df$allCrime17)

df$key <- paste(df$INSTNM, df$BRANCH, sep=": ")


dfNew<-df[,140:151]
dfNew$name <-df$key

library(ggplot2)

x<-2006:2017

for (i in 1:32) {
  d<-t(as.vector(dfNew[i,1:12]))
  lines(x,d,type="o", xlab = "Year", ylab="Total Crime Events", main=dfNew[i,13])
}

# d<-t(as.vector(dfNew[1,1:12]))
# plot(x,d,type="o", xlab = "Year", ylab="Total Crime Events", main="Trends of crime in Milwaukee Colleges")
# 
# for (i in 2:32) {
#   d<-t(as.vector(dfNew[i,1:12]))
#   lines(x,d,type="o")
# }

