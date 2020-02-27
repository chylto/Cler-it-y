df<-read.csv('mkeAll.csv')
df[is.na(df)]<-0

#finds sum of all crime events in a given year in a given location. 

df$allCrime6 <- df[,c(14)]+df[,c(15)]+df[,c(16)]+df[,c(17)]+df[,c(18)]+df[,c(19)]+df[,c(20)]+df[,c(21)]+df[,c(22)]
df$allCrime7 <- df[,c(23)]+df[,c(24)]+df[,c(25)]+df[,c(26)]+df[,c(27)]+df[,c(28)]+df[,c(29)]+df[,c(30)]+df[,c(31)]
df$allCrime8 <- df[,c(32)]+df[,c(33)]+df[,c(34)]+df[,c(35)]+df[,c(36)]+df[,c(37)]+df[,c(38)]+df[,c(39)]+df[,c(40)]

df$allCrime9 <- df$MURD9+df$AGG_A9+df$ARSON9+df$NEG_M9+df$ROBBE9+df$VEHIC9+df$BURGLA9+df$FORCIB9+df$NONFOR9
df$allCrime10 <- df$MURD10+df$AGG_A10+df$ARSON10+df$NEG_M10+df$ROBBE10+df$VEHIC10+df$BURGLA10+df$FORCIB10+df$NONFOR10
df$allCrime11 <- df$MURD11+df$AGG_A11+df$ARSON11+df$NEG_M11+df$ROBBE11+df$VEHIC11+df$BURGLA11+df$FORCIB11+df$NONFOR11
df$allCrime12 <- df$MURD12+df$AGG_A12+df$ARSON12+df$NEG_M12+df$ROBBE12+df$VEHIC12+df$BURGLA12+df$FORCIB12+df$NONFOR12
df$allCrime13 <- df$MURD13+df$AGG_A13+df$ARSON13+df$NEG_M13+df$ROBBE13+df$VEHIC13+df$BURGLA13+df$FORCIB13+df$NONFOR13
#df$allCrime14 <- df$MURD14+df$AGG_A14+df$ARSON14+df$NEG_M14+df$ROBBE14+df$VEHIC14+df$BURGLA14+df$FORCIB14+df$NONFOR14
#df$allCrime15 <- df$MURD15+df$AGG_A15+df$ARSON15+df$NEG_M15+df$ROBBE15+df$VEHIC15+df$BURGLA15+df$FORCIB15+df$NONFOR15
#df$allCrime16 <- df$MURD16+df$AGG_A16+df$ARSON16+df$NEG_M16+df$ROBBE16+df$VEHIC16+df$BURGLA16+df$FORCIB16+df$NONFOR16
#df$allCrime17 <- df$MURD17+df$AGG_A17+df$ARSON17+df$NEG_M17+df$ROBBE17+df$VEHIC17+df$BURGLA17+df$FORCIB17+df$NONFOR17

df$allCrime14 <-df$MURD14+df$RAPE14+df$AGG_A14+df$ARSON14+df$FONDL14+df$INCES14+df$NEG_M14+df$ROBBE14+df$STATR14+df$VEHIC14+df$BURGLA14
df$allCrime15 <-df$MURD15+df$RAPE15+df$AGG_A15+df$ARSON15+df$FONDL15+df$INCES15+df$NEG_M15+df$ROBBE15+df$STATR15+df$VEHIC15+df$BURGLA15
df$allCrime16 <-df$MURD16+df$RAPE16+df$AGG_A16+df$ARSON16+df$FONDL16+df$INCES16+df$NEG_M16+df$ROBBE16+df$STATR16+df$VEHIC16+df$BURGLA16
df$allCrime17 <-df$MURD17+df$RAPE17+df$AGG_A17+df$ARSON17+df$FONDL17+df$INCES17+df$NEG_M17+df$ROBBE17+df$STATR17+df$VEHIC17+df$BURGLA17

write.csv(df,file='mkeAll.csv')
