#���鶨��
FirstArray<-seq(1:24)
FirstArray
dim(FirstArray)<-c(3,4,2)    #ͨ��dim()���������������ά���ռ�
FirstArray                 #�����������:Խ��ǰ���±�仯Խ��;Խ������±�仯Խ��
FirstArray <- array(seq(1:24),dim=c(3,4,2))
FirstArray

#ͨ��dimnames����
Prices <- array(c(20,24,22,56,76,87),dim=c(2,3), dimnames=list(c("vender1","vender2"),c("64M","128M","256M")))
Prices
Prices[,c(��64M��,��256M��)]      #ͨ��ά����������