options(scipen=999) # disable scientific notation
A = matrix(c(1, -1, 0, -1, 2, -1, 0, -1, 1), nrow = 3, ncol = 3)
e <- eigen(A)
print(e$values) # eigen values
print(e$vectors) # eigen vectors
print(svd(A)) # singular value decomposition
