#lapply

function (X, FUN, ...)
{
  FUN <- match.fun(FUN)
  if (!is.vector(X) || is.object(X))
    X <- as.list(X)
  .Internal(lapply(X, FUN))
}

#actual looping is done internally in C  code.

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

z <- list (a = 1:4, b= rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))
lapply(z, mean)

a <- 1:4
lapply(a, runif)

lapply(a, runif, min = 0, max = 10)

u <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(u, function(elt) elt[1,])

#sapply

sapply(z, mean)

#apply

m <- matrix(rnorm(200), 20 , 10)
apply(m, 2, mean)
apply(m, 1, sum)

apply(m, 1, quantile, probs = c(0.25, 0.75))

i <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(i, c(1, 2), mean) #or use
rowMeans(i, dims = 2)

#col/row sums and means

rowsum = apply(m, 1, sum)
rowMeans = apply(m, 1, mean)
colSums = apply(m, 2, sum)
colMeans = apply(m, 2, mean)

#mapply

mapply(rep, 1:4, 4:1)

#vectorizing a function

noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}
noise(5,1,2)
noise(1:5, 1:5, 2)

mapply(noise, 1:5, 1:5, 2)

#tapply

j <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)

tapply(j, f, mean) 
tapply(j, f, mean, simplify = FALSE)

tapply(j, f, range)

#split

split(j, f)

lapply(split(j, f), mean)

#splitting a data frame

library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

#splitting on more than one level

o <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)

interaction(f1, f2)

str(split(o, list(f1, f2)))

str(split(o, list(f1, f2), drop = TRUE))

printmessage <- function(x) {
  if(x > 0)
    print("x is greater than zero!")
  else
    print("x is less than or equal to zero!")
  invisible(x)
}

printmessage2 <- function(x) {
  if(is.na(x))
    print("x is missing value!")
  else if(x > 0)
    print("x is greater than zero!")
  else
    print("x is less than or equal to zero!")
  invisible(x)
}
