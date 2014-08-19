####
library(quantmod)
library(DMwR)
library(ggplot2)

getSymbols("^GSPC", from="2014-01-01")
candleChart(GSPC)

####
data(algae)
summary(algae)

newAlgae <- knnImputation(algae, k=10)
qplot(newAlgae$Chla)

disChla1 <- cut(newAlgae$Chla, 5)
table(disChla1)

disChla2 <- cut(newAlgae$Chla, quantile(newAlgae$Chla,probs = seq(0,1,0.25)))
table(disChla2)


