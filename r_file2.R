Tr2<-read.transactions("BreakBasket_DMS.csv", format="single", cols=c(3,4), sep=",", rm.duplicates=TRUE)
itemFrequencyPlot(Tr2, topN= 10)

reglas2 <- apriori(Tr2, parameter= list( supp=.01, conf=0.5, minlen=2))

reglas2<- sort(reglas2, by= "support", decreasing=TRUE)
inspect(reglas2)

trans_csv <- read.csv("BreadBasket_DMS.csv")

#Visualization- Transactions per Month
trans_csv 
  mutate(Month=as.factor(month(Date))) 
  group_by(Month) 
  summarise(Transactions=n_distinct(Transaction)) 
  ggplot(aes(x=Month, y =Transactions)) +
  geom_bar(stat="identity", fill="mistyrose2", 
           show.legend=FALSE, colour="black") +
 geom_label(aes(label=Transactions)) +
 labs(title="Transacciones por mes") +
 theme_bw()


  