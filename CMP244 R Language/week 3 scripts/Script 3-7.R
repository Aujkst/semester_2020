#数组向量混合运算
a1 <- array(1:12,dim=c(4,3))
a2 <- array(1:9,dim=c(3,3))
a1
a2
a1 + a2
a2 <- array(1:9,dim=c(4,3))
a2
a1 + a1
a1 * a2
a3 <- array(1:3,dim=c(1,3))
a3

#向量有循环补齐的特点
a4 <- 1:3
a4
a4 + a2
a5 <- 1:7
a5
a4 + a5
a6 <- 1:13
a6
a6 + a2
a7 <- 1:24
a7
a7 + a2

#数组的外积
A <- array(1:4,dim=c(2,2))
B <- array(1:12,dim=c(3,4))
A
B
B%o%A
AB <- outer(B,A,“*”)
A%o%B

#数组转置
x <- array(1:6,2:3)
x
xt <- aperm(x,c(2,1))
xt
xt <- aperm(x,c(2,1),resize=F)
y <- array(1:24, 2:4)
y
yt <- aperm(y,c(2,1,3))
yt
