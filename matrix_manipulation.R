A <- matrix(c(2, 3, 1, 2), nrow = 2, ncol = 2)
b <- c(4, -1)
b1 <- c(4, -1, 0)
print(A * b)
A
A %*% b
print(A %*% as.matrix(b))

A = matrix(c(5, 0, 3, 3, 2, 1, 1, 1, 2), nrow = 3, ncol = 3)
det(A)
