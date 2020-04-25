# df1<-read.csv('mke060708.csv')
# df2<-read.csv('mke091011.csv')
# df3<-read.csv('mke121314.csv')
# df4<-read.csv('mke151617.csv')
# 
# library(dplyr)
# 
# df<-full_join(df1,df2, by=c("INSTNM","BRANCH"))
# df<-full_join(df,df3,by=c("INSTNM","BRANCH"))
# df<-full_join(df, df4, by=c("INSTNM","BRANCH"))
# write.csv(df, 'mkeAll.csv')
#df<-merge(df1,df2, by=c("INSTNM","BRANCH"),all=TRUE)


df<-read.csv('data.csv')

df$pc6 <- df$allCrime6/df$Total.678
df$pc7 <- df$allCrime7/df$Total.678
df$pc8 <- df$allCrime8/df$Total.678
df$pc9 <- df$allCrime9/df$Total.91011
df$pc10 <- df$allCrime10/df$Total.91011
df$pc11 <- df$allCrime11/df$Total.91011
df$pc12 <- df$allCrime12/df$Total.121314
df$pc13 <- df$allCrime13/df$Total.121314
df$pc14 <- df$allCrime14/df$Total.121314
df$pc15 <- df$allCrime15/df$Total.151617
df$pc16 <- df$allCrime16/df$Total.151617
df$pc17 <- df$allCrime17/df$Total.151617


df$pt6 <- df$pc6 * 1000
df$pt7 <- df$pc7 * 1000
df$pt8 <- df$pc8 * 1000
df$pt9 <- df$pc9 * 1000
df$pt10 <- df$pc10 * 1000
df$pt11 <- df$pc11 * 1000
df$pt12 <- df$pc12 * 1000
df$pt13 <- df$pc13 * 1000
df$pt14 <- df$pc14 * 1000
df$pt15 <- df$pc15 * 1000
df$pt16 <- df$pc16 * 1000
df$pt17 <- df$pc17 * 1000

write.csv(df,'data.csv')
