#����˷�
a1 <- matrix(c(1,2,3,4,5,6),nrow=2,ncol=3)
a2<-matrix(seq(1:9),nrow=3,ncol=3)
a1
a2
a1%*%a2
a1%*%a1
a2%*%a1

#��ⷽ����
Coefficient<-array(c(3,2,-2,1),dim=c(2,2))   #ϵ������
Result<-c(12,1)                              #�������
solve(Coefficient,Result)                    #sovle()�������Է���������ʽ���
solve(Coefficient)                           #�����Coefficient����
solve(Coefficient)%*%Result