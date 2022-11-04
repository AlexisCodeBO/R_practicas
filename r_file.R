Tr2<-read.transactions("notepad.txt", format = "basket", 
                  sep = ",", header = FALSE )

inspect(Tr2)
itemFrequencyPlot(Tr2)
itemFrequencyPlot(Tr2, topN=5, type='absolute')

rules <- apriori(TR, parameter = list(supp =0.1, conf=0.7, minlen=2))
rules2 <-sort(rules, by= "support", decreasing=TRUE)
inspect(rules2)

tablarules <- as.matrix(rules2[1:4, 1:7])  
  