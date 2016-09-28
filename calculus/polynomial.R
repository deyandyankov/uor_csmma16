# disable scientific notation
options(scipen=999)

# create an example polynomial
pol <- function(x) a * x^3 + b * x^2 + c*x + d

# set constants
a <- 3
b <- 4
c <- -3
d <- 4

# get a list of x values and run them through the polynomial
x <- seq(-3, 2, 0.1)
y <- pol(x)

# plot the results y = pol(x) = f(x)
plot(x, y, type = 'l')

# get the derivative
dx <- deriv(~ a*x^3 + b*x^2 + c*x + d, c("x"), func = TRUE, hessian = TRUE)

# fetch the gradient and hessian functions returned by deriv()
grad <- function(x) attr(dx(x), "gradient")[1]
hess <- function(x) attr(dx(x), "hessian")[1]

# recursive function that allows us to loop over values of x, enabling us to find local min/max
get_x_init <- function(x_init) {
  result <- x_init - (grad(x_init) / hess(x_init))
  if (abs(result - x_init) < 0.001) {
    return(result)
  }
  get_x_init(result)
}

# approximate x values for local minimums and maximums
x1 <- round(get_x_init(-2), 6)
x2 <- round(get_x_init(1.5), 6)
approximated_roots <- sort(c(x1, x2))

# polynomial roots
polyroots <- polyroot(c(c, 2*b, 3*a))
xroot1 <- as.numeric(round(polyroots[1], 6))
xroot2 <- as.numeric(round(polyroots[2], 6))
polyroots <- sort(c(xroot1, xroot2))

# print results and see how close we are
print(paste0("Approximated roots: [", approximated_roots[1], ", ", approximated_roots[2], "]"))
print(paste0("Roots: [", polyroots[1], ", ", polyroots[2], "]"))
