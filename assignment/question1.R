library(ggplot2)
source("multiplot.R")

# prepare the data
x <- seq(from = -pi, to = pi, length.out = 200)
df <- data.frame(
        x = x,
        y_sin = sin(x - pi/4),
        y_tan = tan(x)
)

# define the plots
# y = sin(x = pi/4), no asymptotes
plot_sin <- ggplot(df, aes(x, y_sin)) +
        ggtitle("y = sin(x - pi/4)") +
        ylab("y") +
        ylim(c(-1, 1)) +
        xlim(c(-pi, pi)) +
        geom_point()

# y = tan(x), asymptotes at -pi/2 and pi/2
plot_tan <- ggplot(df, aes(x, y_tan)) +
        ggtitle("y = tan(x)") +
        ylab("y") +
        ylim(c(-1, 1)) +
        xlim(c(-pi, pi)) +
        geom_point() +
        geom_vline(xintercept = -pi/2, col = "red", linetype = "dashed") +
        geom_vline(xintercept = pi/2, col = "red", linetype = "dashed")

# display plots
multiplot(plot_sin, plot_tan, cols=2)