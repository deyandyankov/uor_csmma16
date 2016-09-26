source("vectors.R")
m1 <- matrix(v1)
print(m1)
m2 <- matrix(v2, nrow = 2, byrow = TRUE)
print(m2)
m3 <- cbind(v1, v2)
print(m3)
m4 <- rbind(v2, v4)
if (is.matrix(m4)) {
  print("m4 is a matrix!")
}

print(m1[2, 1])
print(m2[2, ])
m3[m3 <= 2] <- 0
print(m3)

degree_coef <- pi / 180
x <- seq(from = 0, to = 360, length.out = 200)
x
y <- sin(x * degree_coef)
y


