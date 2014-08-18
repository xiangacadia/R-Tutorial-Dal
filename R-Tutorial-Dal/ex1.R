#Hands on 1

d <- c(Portugal=10.3, Spain=10.6, Italy=11.5, France=12.3, Germany=9.9, Greece=9.3, UK=11.4, Finland=10.9, Belgium=12.1, Austria=9.1)

# Prices above 10
d[d>10]

# Prices above average
mean(d)
d[d>mean(d)]

# Prices between 10 and 11
d[d>10 & d<11]

# Raise prices by 10%
d*1.1

# Decrease prices by 2.5%, and countries above average
newData <- d*0.975
newData[newData>mean(newData)]

########
# Load data
data(Boston, package='MASS')

help(Boston, package='MASS')

# Median price higher than 45
Boston$medv[Boston$medv > 45]
subset(Boston, Boston$medv > 45)

# rm > 8
subset(Boston, Boston$rm > 8, c(nox, tax))

# medv between 10 and 15
subset(Boston, Boston$medv > 10 & Boston$medv < 15)

# Average crim for regions with rooms above 6
mean(Boston$crim[Boston$rm > 6])

###########

library(DMwR)
data(algae)

# which season has more sample data
summary(algae)
summary(algae$season)

counts <- table(algae$season)
names(counts)[which.max(counts)]
table(algae$season, algae$size)

# Average value of a5
mean(algae$a5)

# Average value of NO3
summary(algae$NO3)
mean(algae$NO3, rm.NA=TRUE)

filter(algae, algae$a2 > quantile(algae$a2, probs=0.9))

by(cbind(algae$a1,algae$a4), algae$season, summary)

# the second parameter should be a list
aresult <- aggregate(algae$NO3, by=list(algae$season), mean, na.rm=T)
aresult[order(aresult$x), ]
