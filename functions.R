add2 < - function(x, y) {
  x + y
}


x = 17
above10 <- function(x) {
  use <- x > 10
  x[use]
}


above <- function(x, n) {
  use <- x > n
  x[use]
}


columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for( i in 1:nc) {
    means[i] <- mean (y [, i], na.rm = removeNA)
  }
  means
}


# lazy evaluation

f <- function(a, b) {
  print(a)
  print(b)
}

#"..." argument

myplot <- function(x, y, type = "1", ...) {
  plot (x, y, type = type, ...)
}


args(paste)
function(..., sep = " ", collapse = NULL)
  
args(cat)
function(..., file = " ", sep = " ", 
  fill = FALSE, labels = NULL, append = FALSE)

  
lm <- function(x) {x * x}


make.power <- function(n) {
  pow <- function(x)  {
        x^n
  }
  pow
}


cube <- make.power(3)
square <- make.power(2)
