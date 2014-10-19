library(ggplot2)

data(ToothGrowth)
?ToothGrowth
attach(ToothGrowth)

table(list(supp,dose))

g1 <- ggplot(ToothGrowth)
g1 + geom_histogram(aes(x=len), binwidth=2)
g1 + geom_histogram(aes(x=len, fill=supp), binwidth=2) + facet_grid(supp~.)
g1 + geom_histogram(aes(x=len, fill=factor(dose)), binwidth=2) + facet_grid(dose~.)
g1 + geom_histogram(aes(x=len, fill=factor(dose)), binwidth=2) + facet_grid(dose~supp)

aggregate(len ~ supp, data=ToothGrowth, mean)
aggregate(len ~ dose, data=ToothGrowth, mean)
aggregate(len ~ dose + supp, data=ToothGrowth, mean)

tg0.51 <- subset(ToothGrowth, dose!=2)
tg0.52 <- subset(ToothGrowth, dose!=1)
tg12 <- subset(ToothGrowth, dose!=0.5)

t.test(len ~ supp, data=ToothGrowth)
t.test(len ~ dose, data=tg0.51)
t.test(len ~ dose, data=tg0.52)
t.test(len ~ dose, data=tg12)