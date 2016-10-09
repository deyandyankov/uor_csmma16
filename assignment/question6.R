library(ggplot2)
source("multiplot.R")
# Generate m datasets with sample size nn from a binomial distribution
gen_binomial_means <- function(nn, m) {
        trials <- 10
        binom_distributions <- matrix(rbinom(m * nn, trials, 0.01), nrow = nn, ncol = m)
        result <- apply(binom_distributions, 2, mean)
        return(result)
}

# get 10000 means for two groups of x (sizes 20 and 1000)
means <- lapply(c(20, 1000), gen_binomial_means, 10000)

# Plot histograms of the two groups of means
group1 <- data.frame(x = means[[1]])
group2 <- data.frame(x = means[[2]])

group1_plot <- ggplot(group1, aes(x = x)) +
        geom_histogram(binwidth=0.001) +
        xlab("mean(x)") +
        ggtitle("When nn = 20")

group2_plot <- ggplot(group2, aes(x = x)) +
        geom_histogram(binwidth=0.001) +
        xlab("mean(x)") +
        ggtitle("When nn = 1000")

multiplot(group1_plot, group2_plot, cols=2)

