#if else structure

if(x>3) {
   y <- 10
 } else {
   y <- 0
   }

y <- if(x > 3) {
  10
} else {
  0
}


#for structure


for(i in 1:4) {
  print(i)
}

x <- c("a", "b", "c", "d")

for(i in 1:4) {
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])

#nested for loops

x <- matrix (1:6, 2, 3)

for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}


#while loops

count <- 0

while (count < 10) {
  print(count)
  count <- count + 1
}

z <- 4

while(z >= 3 && z <= 10) {
   print(z)
   coin <- rbinom(1,1,0.5)
   
   if (coin ==1) { #random walk
     z <- z + 1
     
   } else {
     z <- z - 1
   }
 }

#repeat 

x0 <- 1
tol <- le-8

repeat{
  x1 <- computeEstimate()  # computeEstimate() is not a real function.
  
  if(abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

#next, return

for(i in 1:100) {
  if (i <= 20) {
 ##skip to the first 200 iterations
      next 
}
  ## do something here
}
