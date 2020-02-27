df1<-read.csv('mke060708.csv')
df2<-read.csv('mke091011.csv')
df3<-read.csv('mke121314.csv')
df4<-read.csv('mke151617.csv')

library(dplyr)

df<-full_join(df1,df2, by=c("INSTNM","BRANCH"))
df<-full_join(df,df3,by=c("INSTNM","BRANCH"))
df<-full_join(df, df4, by=c("INSTNM","BRANCH"))
write.csv(df, 'mkeAll.csv')
#df<-merge(df1,df2, by=c("INSTNM","BRANCH"),all=TRUE)
