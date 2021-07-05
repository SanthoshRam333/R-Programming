#generating random numbers

#probability distribution func. usually have 4 functions associated 
#with them. The functions are prefixed with:

# 1. d for density (dnorm)
# 2. r for random number generation (rnorm)
# 3. p for cumulative distribution (pnorm)
# 4. q for quantile function (qnorm)


set.seed(1) #setting the random no. with set.seed for reproducibility
rnorm(5)

rpois(10,1)
rpois(10,2)
rpois(10,20)

ppois(2,2)
ppois(4,2)
ppois(6,2)

#simulating a linear model

set.seed(20)
x <- rnorm(100) 
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

#what if x is binary?

set.seed(20)
x <- rbinom(100, 1, 0.5) 
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

#simulating a Poisson model

set.seed(1)
x <- rnorm(100) 
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)

#random sampling

set.seed(1)
sample(1:10, 4)
sample(letters, 5)
sample(1:10) #permutaion
sample(1:10)
sample(1:10, replace = TRUE) # sample w/replacement

#timing longer expressions

system.time( {
  n <- 100
  r <- numeric(n)
  for (i in 1:n) {
    x <- rnorm(n)
    r[i] <- mean(x)
  }
})

# R Profiler

Rprof()


#by.total: divides the time spend in each function by the total run time

#by.self: does the same but first subtracts out time spent in functions above 
#in the call stack

#summaryRprof() makes the output of Rprof READABLE.

# DO NOT USE system.time and rprof() at the same time.