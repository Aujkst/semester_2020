#����������
A <- matrix(1:16,nrow=4)
A
solve(A)
qr(A)$rank
#�������һ����ѭ��̬�ֲ��ľ��󣬱��������ֲ�����������4X4�ľ���
A <- matrix(rnorm(16),4,4)
A
solve(A)
solve(A)%*%A

#���������ֵ����������
A <- matrix(rep(1,16),nrow=4)
A
A.eigen <- eigen(A,symmetric = T)
A.eigen
A <- A+diag(4)
A
A.eigen <- eigen(A,symmetric = T)
A.eigen

#����������ǻ�������Cholesky�ֽ⣩
chol(A)
t(chol(A))%*%chol(A)

#���������ʽ��������������
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