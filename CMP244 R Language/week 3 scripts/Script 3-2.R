#�����������
A��<- matrix(1:12,nrow=3,ncol=4)
A
B <- -A
B
A+B
3*A
A%*%t(B)
A*A

#�ԽǾ���
A <- matrix(1:16,nrow=4)
A
diag(A)
diag(diag(A))
diag(4)
diag(2,nrow=4)