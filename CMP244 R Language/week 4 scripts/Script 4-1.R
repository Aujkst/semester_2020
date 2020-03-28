##列表的创建
list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1) 
list_data #或者用print函数
#————————————————————————————————————————————————————————————————
##列表里还可以是矩阵、向量和函数等
mylist <- list(matrix(1:12,c(3,4)),c("Red","Blue"),3*pi,3>4)
mylist #注意对数值运算和逻辑运算显示结果
#————————————————————————————————————————————————————————————————
##列表元素的命名（标签）及列表索引
employee <- list(name="joe", salary=55000,union=T)
employee
employee$salary #通过标签索引
employee$na #标签可以简写，只要不引起歧义
employee[1] #通过单中括号下标索引列表的某个组件
employee[[1]] #通过双中括号下标索引列表的某个组件的值，注意与单括号的区别
ee <- employee[2]
class(ee)
str(ee)
length(employee) #查询列表长度

#————————————————————————————————————————————————————————————————
##通过向量创建列表
z <- vector(mode = "list")
z
z[["abc"]] <- 3 #通过标签赋值
z
z[2] <- 1 #向量的直接赋值
z
z[[3]] <- 2
z
#————————————————————————————————————————————————————————————————
##列表元素的命名还可以使用命名函数
#先创建一个包含向量、矩阵和列表三个元素的列表
list_data <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2), list("green",12.3)) 
#使用names()对列表元素命名
names(list_data) <- c("1st Quarter", "A_Matrix", "A Inner list")
print(list_data)
list_data
print(list_data[1])
print(list_data[3])
print(list_data$A_Matrix)
#————————————————————————————————————————————————————————————————
##增删列表元素
z <- list(a="abc",b=12)
z
z$c <- "sailing" #直接命名增加元素
z
z[[4]] <- 28 #使用索引增加元素
z
z[[5]] <- c(F,T,T) #增加一个向量元素
z
z[6:8] <- c(1:3) #增加多个列表元素
z
z[[2]] <- NULL #直接用NULL对list的元素进行删除
z
c(list("joe",55000,T),list(5)) #拼接两个列表
#————————————————————————————————————————————————————————————————
##列表元素增删更新的举例
list_data <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2), list("green",12.3))
names(list_data) <- c("1st Quarter", "A_Matrix", "A Inner list")
list_data[4] <- "New element" #在列表后增加一个元素
print(list_data[4])
list_data[4] <- NULL #删除该元素
print(list_data[4])
list_data[3] <- "updated element" #更新列表第3个元素的值
print(list_data[3])
#————————————————————————————————————————————————————————————————
##访问列表的元素和值
employee <- list(name="joe", salary=55000,union=T)
names(employee) #通过names()函数查询列表各组件的标签
ule <- unlist(employee)
ule
class(ule)
#————————————————————————————————————————————————————————————————
##利用unlist对列表对象进行数值运算
#先创建两个数值型列表
list1 <- list(1:5)
print(list1)
list2 <- list(10:14)
print(list2)
#————————————————————————————————————————————————————————————————
##将数值型列表转换成数值型向量
v1 <- unlist(list1)
v2 <- unlist(list2)
vprint(v1)
print(v2)
result <- v1+v2
print(result)
#————————————————————————————————————————————————————————————————
##删除列表中元素的名称
#方法1，使用NULL
x <- list(a=5,b="xyz")
x
names(x) <-NULL
x
#方法2，使用unname()函数
y <- list(a=5,b="xyz")
y
y <- unname(y)
y
#————————————————————————————————————————————————————————————————
##apply函数的使用
lapply(list(1:3,25:29),median) #R分别对1:3和25:29求中位数
sapply(list(1:3,25:29),median)
#————————————————————————————————————————————————————————————————
##列表的递归（嵌套）
b <- list(u =5, v = 12)
c <- list(w = 13)
a <- list(b,c)
a
length(a)
#————————————————————————————————————————————————————————————————
#通过拼接函数c()进行列表递归
c(list(a=1,b=2,c=list(d=5,e=9))) #输出3个组件的列表
c(list(a=1,b=2,c=list(d=5,e=9)),recursive=T) #输出数值型向量
c(list(a=1,b=2,c=list(d='red',e='blue')),recursive=T) #输出字符型向量
c(list(a=1,b=T,c=list(d=5,e=9)),recursive=T) #输出数值型向量
c(a=1,b=T,c=list(d=5,e=9))
#————————————————————————————————————————————————————————————————
##列表的合并
#建立两个列表
list1 <- list(1,2,3)
list2 <- list("Sun","Mon","Tue")
#合并两个列表
merged.list <- c(list1,list2)
print(merged.list)







