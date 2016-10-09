library(testthat) # testing library, we later use expect_equal() to test our function
vector_angle <- function(a, b) {
        if (identical(a, c(0, 0)) || identical(b, c(0, 0))) return(NA) # this function is undefined for the (0, 0) point
        rad <- acos(sum(a * b) / (sqrt(sum(a^2)) * sqrt(sum(b^2))))
        angle <- rad * 180/pi
        return(angle)
}

# produces an error unless the angle between alpha (1st param) and beta (2nd param) doesn ot equal the 3rd parameter
expect_equal(vector_angle(c(1, 0), c(0, 1)), 90)
expect_equal(vector_angle(c(1, 0), c(1, 1)), 45)
expect_equal(vector_angle(c(1, 0), c(-1, 0)), 180)
expect_equal(vector_angle(c(1, 0), c(0, -1)), 90)
