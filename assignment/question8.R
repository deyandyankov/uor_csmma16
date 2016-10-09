library(bmp) # used for load images via read.bmp()
image1 <- read.bmp("~/repos/uor_csmma16/assignment/images/1.bmp")
image2 <- read.bmp("~/repos/uor_csmma16/assignment/images/2.bmp")
image3 <- read.bmp("~/repos/uor_csmma16/assignment/images/3.bmp")

# calculate rows and columns, they're the same for all images.
# we'll use this to create the mean_face later on.
rows <- nrow(image1) # 55
cols <- ncol(image1) # 51

# flatten the images from 2 dimentional matrices to 55*51 vectos.
f1 <- as.vector(image1)
f2 <- as.vector(image2)
f3 <- as.vector(image3)

# the three faces in a single matrix (face per column)
faces <- matrix(c(f1, f2, f3), nrow = length(f1), ncol = 3)

# the average of all three faces
mean_face <- matrix(apply(faces, 1, mean), nrow = rows, ncol = cols)

# used for plotting
rotate_matrix <- function(x) t(x)[, nrow(x):1]

# produce an image of the mean face
image(rotate_matrix(mean_face), col = grey((0:32)/32), axes = F)

# produce on one figure images of the difference of each face from the mean
par(mfrow = c(1, 3))
image(rotate_matrix(image1 - mean_face), col = grey((0:32)/32), axes = F)
image(rotate_matrix(image2 - mean_face), col = grey((0:32)/32), axes = F)
image(rotate_matrix(image3 - mean_face), col = grey((0:32)/32), axes = F)

# Based on the covariance matrix of the differences, calculate eigenfaces and
# produce the first three eigenfaces on the same figure.
diff_matrix <- matrix(c(diff1, diff2, diff3), nrow = length(f1), ncol = 3)
diff <- matrix(apply(diff_matrix + mean_face, 1, mean), nrow = rows, ncol = cols)
