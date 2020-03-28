#数组矩阵合并
a1 <- array(1:6,dim=c(2,3))
a2 <- array(1:9,dim=c(3,3))
a1
a2
rbind(a1,a2)
cbind(a1,a2)
t(a1)
a1 <- t(a1)
cbind(a1,a2)

#向量索引
x <- 1:9
names(x) <- letters[1:9]
x
x[5]
x[3:7]
x[-4]
x[-(6:8)]
x[-c(2,4,6,8)]
x[x>6]
x[x>3 & x<=7]
x[c("a","c","g")]
x[x %in% letters[4:10]]
sstr <- c("c","ab","B","bba","c","@","bla","a","Ba","%")
sstr[sstr %in% c(letters,LETTERS)]

#矩阵索引
X <- matrix(1:12,nrow=3,ncol=4,byrow=T,dimnames=list(c(letters[1:3]),LETTERS[4:7]))
X
X[2,3]
X[2,]
X[,3]
X[,c(1,3)]
X["b",]