library(ggplot2)

#creating 10 000 sets of 40 random exponential (0.2)
lambda <- 0.2
nsim <- 100000 
theo.mean <- 1/lambda
theo.var <- lambda^(-2)
expdata <- matrix(rexp(40*nsim,lambda),40)
expmean <- data.frame(Mean40=colMeans(expdata))
sample.mean <- colMeans(expmean)
sample.var <- var(expmean$Mean40)

normdist <- dnorm(expmean$Mean40, mean=theo.mean, sd=sqrt(theo.var/40))

g1 <- ggplot(expmean, aes(x=Mean40))
quantiles <- quantile(expmean$Mean40,c(0.05,0.95))
g1 + geom_histogram(aes(y=..density.., fill=..density..), binwidth=0.1, 
                    color="black") + 
    scale_fill_gradient("Density", low="green", high="red") + geom_density() +
    geom_vline(xintercept=theo.mean, size=2) + 
    geom_vline(xintercept=sample.mean, size=1.5, linetype="dotted", color="blue") +
    geom_vline(xintercept=quantiles, linetype="dotted") +
    geom_line(aes(x=expmean$Mean40, y=normdist), color="orange") +
    ggtitle("Histogram of Mean of 40 Random Variable from exp(0.2)") + 
    theme(plot.title = element_text(face="bold"))


var.ratio <- sample.var/theo.var

CI <- theo.mean + c(-1,1)*1.96*sqrt(sample.var/40)
CI <- data.frame(Lower=CI[1],Upper=CI[2])

