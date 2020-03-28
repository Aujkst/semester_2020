#矩阵乘法
a1 <- matrix(c(1,2,3,4,5,6),nrow=2,ncol=3)
a2<-matrix(seq(1:9),nrow=3,ncol=3)
a1
a2
a1%*%a2
a1%*%a1
a2%*%a1

#求解方程组
Coefficient<-array(c(3,2,-2,1),dim=c(2,2))   #系数矩阵
Result<-c(12,1)                              #结果矩阵
solve(Coefficient,Result)                    #sovle()返回线性方程组行列式结果
solve(Coefficient)                           #求矩阵Coefficient的逆
solve(Coefficient)%*%Result
