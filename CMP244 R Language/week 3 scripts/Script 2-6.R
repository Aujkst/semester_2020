#PPT中包含语句的使用
x <- c(1,1,1,0,0,1,1)
x %in% 1
x %in% c(1,0)
x %in% c(1,2)
ifelse(x %in% 1,1,0) #若x的值包含在1里面，输出1，否则输出0 
ifelse(x %in% 1,'yes','no') #若x的值包含在1里面，输出"yes"，否则输出"no" 
which(x %in% 1) #输出x包含在1中值的位置
y <- c(2,1,3,4)
z <- c(1,4)
ifelse(y %in% z,which(y==z),0) #若y的值包含在z里面，输出y==z的位置，否者输出0 
which(y %in% z)
ifelse(y %in% z,1,0)