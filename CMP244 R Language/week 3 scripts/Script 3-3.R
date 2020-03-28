#矩阵的逆和秩
A <- matrix(1:16,nrow=4)
A
solve(A)
qr(A)$rank
#随机生成一个遵循正态分布的矩阵，避免它出现不可逆的情况，4X4的矩阵
A <- matrix(rnorm(16),4,4)
A
solve(A)
solve(A)%*%A

#矩阵的特征值与特征向量
A <- matrix(rep(1,16),nrow=4)
A
A.eigen <- eigen(A,symmetric = T)
A.eigen
A <- A+diag(4)
A
A.eigen <- eigen(A,symmetric = T)
A.eigen

#矩阵的上三角化操作（Cholesky分解）
chol(A)
t(chol(A))%*%chol(A)

#矩阵的行列式和其它基本操作
A
det(A)
dim(A)
nrow(A)
ncol(A)
rowSums(A)
rowsum(A,rep(1,4))
colSums(A)
colMeans(A)
rowMeans(A)
dist(A)