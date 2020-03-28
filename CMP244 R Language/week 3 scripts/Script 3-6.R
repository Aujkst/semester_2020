#数组定义
FirstArray<-seq(1:24)
FirstArray
dim(FirstArray)<-c(3,4,2)    #通过dim()函数来定义数组的维数空间
FirstArray                 #数组的填充规则:越靠前的下标变化越快;越靠后的下标变化越慢
FirstArray <- array(seq(1:24),dim=c(3,4,2))
FirstArray

#通过dimnames索引
Prices <- array(c(20,24,22,56,76,87),dim=c(2,3), dimnames=list(c("vender1","vender2"),c("64M","128M","256M")))
Prices
Prices[,c(“64M”,“256M”)]      #通过维名访问数组