?par
par()
plot(x, y, type = 'l')
plot(x, y, type = 'l', xaxt = 'n', xlab = expression(paste("Angle ", theta)), ylab = expression("sin " * theta))
axis(1, at = c(0, 90, 180, 270, 360))
text(270, 1/2, substitute(alpha[1]^2 == "2"))

par(new=T)
plot(x, cos(x * pi/180), type = 'l', axes = F, xlab = "", ylab = "", col = "red")
lines(x, cos(x * pi/180)^2, lty = 2, col = "blue")
curve(sin(x * pi/180)^2, from = 0, to = 360, lty = 3, add = T, col = "purple")

dev.off()
par(mfrow = c(1, 2))
x <- seq(from = -pi, to = pi, length.out = 100)
plot(x, sin(x - pi/4), xlab = "x", ylab = expression("sin(x)"))
abline(x, x/1, col = "red")
plot(x, tan(x), xlab = "x", ylab = expression("tan(x)"), xlim = c(-pi/2, pi/2), ylim = c(-1, 1))
abline(x, x/1, col = "red")
