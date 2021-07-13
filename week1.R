#creating vectors

x <- c(0.5, 0.6) #numeric
x <- c(T, F) #logical
x <- c("a", "b", "c") #charachter
x <- 9 : 29 #integer
x <- c(1+0i, 2+4i) #complex

x <- vector("numeric", length = 10)
x


#mixing objects

y <- c(1.7, "a") #charachter
y <- c(T, 2) #numeric
y <- c("a", T) #charachter


#explicit coercion

x <- 0:6
as.numeric(x)
as.logical(x)
as.character(x)

x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)
as.complex(x)


#lists

x <- list(1, "a", T, 1 + 4i)
x


#matrices

m <- matrix(nrow = 2, ncol = 3)
m

n <- matrix(1:6, nrow = 2, ncol = 3)
n


#matrices can also be created from vectors by adding a dimension attribute

v <- 1:10
dim(v) <- c(2,5)
v


#cbind and rbind

x <- 1:3
y <- 10:12

cbind(x, y)
rbind(x, y)


#factors

x <- factor(c("yes", "no", "yes", "yes", "no"))
x
table(x)
unclass(x)

x <- factor(c("yes", "no", "yes", "yes", 'no'), levels = c("yes", "no"))
x


#missing values

x <- c(1, 2, NA, 10, 3)
is.na(x)

x <- c(1, 2, NaN, NA, 4)
is.na(x)


#data frames

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)


#names attributes

x <- 1:3
names(x)
names(x) <- c("foo", "bar", "nerf")
x
names(x)

x <- list(a = 1, b = 2, c = 3)
x

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m


#dput-ing R objects

y <- data.frame(a = 1, b = "a")
dput(y)

dput(y, file = "y.R")
new.y <- dget("y.R")
new.y


#subsetting (basics)

x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x >"a"]

u <- x > "a"
u
x[u]

#subsetting (lists)

x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x$bar
x["bar"]

x <- list(foo = 1:4, bar = 0.6, nerf = "hello")
x[c(1,3)]

x <- list(a= list(10, 12, 14), b = list(2.14, 1.01))
x[[c(1,3)]]
x[[1]][[3]]

x[[c(2,1)]]


#subsetting (matrices)

x <- matrix(1:6, 2, 3)

x[1,2] 
#or
x[1,2, drop = F]

x[2,1]

x[1, ]
#or
x[1, , drop = F]

x[, 2]


#partial matching

x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = F]]


#removing NA values

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]


#what if there are multiple things and you want to take 
#the subset with no missing values

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]


#vectorized operations

x <- 1:4 ; y <- 6:9
x + y
x > 2
x >= 2
y == 8
x * y
x / y


#vectorized matrix operations

x <- matrix(1:4, 2, 2)
y <- matrix(rep(10, 4), 2, 2)
x * y
x / y
x %*% y  #true matrix multiplication
