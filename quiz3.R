#finding the mean of column in a data.frame using subsets

virginica<-subset(iris,Species == 'virginica')
summary(virginica)

sl<-data.frame(iris$Sepal.Length[iris$Species=="virginica"])
summary(sl)

apply(iris[, 1:4], 2, mean) # by columns

# all 3 functions output the same results

sapply(split(mtcars$mpg, mtcars$cyl), mean)

with(mtcars, tapply(mpg, cyl, mean))

tapply(mtcars$mpg, mtcars$cyl, mean)

#the absolute difference between the average 
#horsepower of 4-cylinder cars and the average 
#horsepower of 8-cylinder cars

abs(mean(split(mtcars, mtcars$cyl)$'4'$hp) - mean(split(mtcars, mtcars$cyl)$'8'$hp))

abs(mean(split(mtcars, mtcars$cyl)$'4'$hp) - mean(split(mtcars, mtcars$cyl)$'8'$hp))
