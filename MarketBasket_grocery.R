# Load the libraries
library(arules)
library(arulesViz)
library(datasets)

# Load the data set

tr <- read.transactions('sample-data/market-basket/MarketBasketAnalysis_example.csv', format = 'basket', sep = ',')
summary(tr)
View(tr)
# Create an item frequency plot for the top 20 items
itemFrequencyPlot(tr,topN=20,type="absolute")
# Get the rules

rules <- apriori(tr, parameter = list(supp = 0.001, conf = 0.001, target="rules"))
rules<-sort(rules, by="confidence", decreasing=TRUE)
summary(rules)
#Number of rules
print(length(rules))
# Show the top 5 rules, but only 2 digits
options(digits=2)
#inspect(rules[1:5])

write(rules,
      file = "sample-data/market-basket/MarketBasketAnalysis_result.csv",
      sep = ",",
      quote = TRUE,
      row.names = FALSE)

