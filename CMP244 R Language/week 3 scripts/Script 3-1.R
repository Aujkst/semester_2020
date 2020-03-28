A　<- matrix(1:12,nrow=3,ncol=4)
A
x <- 1:10
x
class(x)
y <- t(x)
y
class(y)
B <- matrix(c(32,45,6,89), nrow=2)
B
rnames <- c("R1","R2")
cnames <- c("C1","C2")
B <- matrix(c(32,45,6,89), nrow=2, dimnames=list(rnames,cnames))
B
C <- matrix(1:10,nrow=3) #数据长度不是矩阵行数的整倍
C <- array(1:10,c(3,4))
C
D <- array(1:10,c(3,2))
D
