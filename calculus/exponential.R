# this is no solution really, just what we had in the paper plus some plotting.
# to do the exercise one must find the maximum without optimize()

myfunction <- function(t) (1 + 2.5*t) * exp(-0.3 * t)
x <- round(seq(-1, 30, by = 0.1), 6) # [1] -1.0 -0.9 -0.8 -0.7 -0.6 -0.5
y <- round(myfunction(x), 6) # [1] -2.024788 -1.637456 -1.271249 -0.925259 -0.598609 -0.290459 ...

# find the maximum value of y for -1 < x < 10
o <- optimize(myfunction, lower = -1, upper = 10, maximum = TRUE)
o$maximum <- round(o$maximum, 6)
print(paste0("Maximum: ", o$maximum))

# some plotting
library(ggplot2) # if this produces an error, run the following and retry: install.packages("ggplot2")
df <- data.frame(x = x, y = y)
ggplot(df, aes(x = x, y = y)) +
  geom_line() +
  geom_point(data = data.frame(x = o$maximum, y = myfunction(o$maximum)), colour = "red") +
  ylab("myfunction(x)")