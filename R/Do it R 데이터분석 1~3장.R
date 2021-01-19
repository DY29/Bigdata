var1 <- c(1,2,5,7,8)
var1

var2<- c(1:5)
var2

var3 <- seq(1,5)
var3
var4<-seq(1,10,by=2)
var4
var5 <-seq(1,10,by=3)
var5

var1 +1
var1+var2
str1<-"a"
str1
str4<-c("a","b","c")
str4

x <- c(1,2,3)
x
mean(x)
max(x)
min(x)
paste(str4, collapse = " ")
x_mean <- mean(x)
x_mean
install.packages("ggplot2")
library(ggplot2)
qplot(x)
x <- ("a","a", "b", "c")
qplot(x)
qplot(data = mpg, x = hwy)
qplot(data = mpg, x =drv, y = hwy )
qplot(data = mpg, x =drv, y = hwy, geom = "line" )

qplot(data = mpg, x =drv, y = hwy, geom = "boxplot", colour = drv )

?qplot
score <- c(80, 60, 70, 50, 90)
score
mean(score)
mean_score <- mean(score)
mean_score
