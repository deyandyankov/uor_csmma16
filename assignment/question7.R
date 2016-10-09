library(ggplot2)
set.seed(23)
sample_size <- 25
theoretical_mean <- 10
theoretical_sd <- 1
samples <- 100

confidence_interval_hit <- function(sample_size, theoretical_mean, theoretical_sd) {
        t <- t.test(rnorm(sample_size, theoretical_mean, theoretical_sd), alternative = c("two.sided"), mu = theoretical_mean)
        return(theoretical_mean > t$conf.int[1] & theoretical_mean < t$conf.int[2])
}

# this number should be roughly 95
pct_hits <- sum(sapply(1:samples, function(x) confidence_interval_hit(sample_size, theoretical_mean, theoretical_sd)))
print("Generate 100 confidence intervals and count how often these intervals contain the mean")
print(paste0("Result: ", pct_hits))

# everything below this line is just playing around.
# let's run the above 100 times and plot the results
# the expectation is that y will be close to 95 most of the time
y <- c()
for (i in 1:samples) {
        y <- c(y, sum(sapply(1:samples, function(x) confidence_interval_hit(sample_size, theoretical_mean, theoretical_sd))))
}

simulation_results <- ggplot(data.frame(x = 1:length(y), y = y), aes(x = x, y = y)) +
        ggtitle("Each point represents this: Generate 100 confidence intervals \ 
        and count how often these intervals contain the mean.") +
        geom_point() +
        ylim(c(80, 100)) +
        geom_hline(yintercept = mean(y), col = "blue") # this mean will always be very close to 95!
