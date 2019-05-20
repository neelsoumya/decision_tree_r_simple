######################################################################
# Simple example for regression tree and classification tree in R
#
# Adapted from:
#   https://www.statmethods.net/advstats/cart.html
#
# install.packages("rpart")
# install.packages("partykit")
#####################################################################

####################
# Load library
####################
library(rpart)
library(partykit)

####################
# grow tree
####################
fit <- rpart(formula = Mileage ~ Price + Country + Reliability + Type,
             method="anova", data=cu.summary)

printcp(fit) # display the results
plotcp(fit) # visualize cross-validation results
summary(fit) # detailed summary of splits

########################################
# create additional plots
########################################
par(mfrow=c(1,2)) # two plots on one page
rsq.rpart(fit) # visualize cross-validation results  

####################
# plot tree
####################
plot(fit, uniform=TRUE,
     main="Regression Tree for Mileage ")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

############################################################
# create attractive postcript plot of tree
############################################################
post(fit, file = "tree.ps",
     title = "Regression Tree for Mileage ")





fit <- ctree(formula = Mileage ~ Price + Country + Reliability + Type,
             data = cu.summary)
plot(fit)
