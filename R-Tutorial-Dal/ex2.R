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

##################
# remove all rows with NA
new_algae <- algae[complete.cases(algae),]

# build a decision tree to predict a1
treeAlgae <- algae[, 1:12]
tree <- rpartXse(a1 ~ ., treeAlgae) 
preds <- predict(tree, algae)

# Visualize the tree
prettyTree(tree)

# load test data
data(testAlgae)
data(algaeSols)

test_preds <- predict(tree, test.algae)

visual_data <- rbind(data.frame(result=test_preds, label=rep(1, length(test_preds))), data.frame(result=algae.sols$a1, label=rep(0, length(test_preds))))

boxplot(x=c(1, length(test_preds), y=visual_data$result, color=visual_data$label))

#############
# Random forest
library(randomForest)
data(Boston,package = "MASS")
samp <- sample(1:nrow(Boston), 354) 
tr <- Boston[samp, ]
ts <- Boston[-samp, ]
m <- randomForest(medv ~ ., tr)
ps <- predict(m, ts) 
mean(abs(ts$medv - ps))

#############
algae <- knnImputation(algae)
samp <- sample(1:nrow(algae), 150)
tr <- algae[samp, ]
ts <- algae[-samp,]
m <- randomForest(a4 ~ ., algae[,c(1:11,15)], importance=T)
ps <- predict(m, ts) 
mean(abs(ts$a4 - ps))
importance(m)
varImpPlot(m)

# Linear regression
lm_model <- lm(a4 ~ ., algae[,c(1:11,15)])
summary(lm_model)
final_lm <- step(lm_model)
summary(final_lm)
lm_predict <- predict(final_lm, ts)

# compare prediction for different model
plot(ps, lm_predict)

