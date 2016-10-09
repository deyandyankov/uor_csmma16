# disable scientific notation
options(scipen=999)

myfunction <- function(t) (1 + 2.5*t) * exp(-0.3 * t)
x <- seq(-1, 30, by = 0.1)
y <- round(myfunction(x), 4)

# get the derivative
dx <- deriv(~ (1 + 2.5*t) * exp(-0.3 * t), c("t"), func = TRUE, hessian = TRUE)

# fetch the gradient and hessian functions returned by deriv()
grad <- function(x) attr(dx(x), "gradient")[1]
hess <- function(x) attr(dx(x), "hessian")[1]

# recursive function that allows us to loop over values of x, enabling us to find local min/max
get_x_init <- function(x_init) {
        result <- x_init - (grad(x_init) / hess(x_init))
        if (abs(result - x_init) < 0.0001)
                return(result)
        get_x_init(result)
}

# get optimal value for x
x_init <- get_x_init(5)

# some plotting
library(ggplot2) # if this produces an error, run the following and retry: install.packages("ggplot2")
df <- data.frame(x = x, y = y)
v_label <- paste0("(", round(x_init, 6), ", ", round(myfunction(x_init), 6), ")")
ggplot(df, aes(x = x, y = y)) +
        ggtitle("Optimal value") +
        geom_line() +
        geom_point(data = data.frame(x = x_init, y = myfunction(x_init)), colour = "red") +
        geom_text(aes(x = x_init + 8, y = myfunction(x_init), label = v_label), colour = "red") +
        ylab("myfunction(x)")