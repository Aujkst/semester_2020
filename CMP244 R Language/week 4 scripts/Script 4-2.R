##创建数据框
L5=LETTERS[1:5] #前五个大写字母
#利用data.frame创建有三列分量的数据框
d <- data.frame(cbind(x = 1, y = 1:10),fac = sample(L5, 10, replace = TRUE))
d
mode(d[1]) #list
mode(d[[1]]) #numeric
length(d[1]) #列表的组件数
length(d[[1]]) #数值向量的长度
d[[2]][3] #类似矩阵索引
d[3,2]
d[2,3] #注意是数据类class是因子型
class(d[2,3])
##-------------------------------------------------------------------------------
##字符向量被强制转换成因子
d <- data.frame(cbind(x = 1, y = 1:10), fac=sample(L5, 10, replace = TRUE), HT=sample(c("H","T"),10,replace = T))
rbind(class=sapply(d, class), mode=sapply(d, mode))
d[3]
class(d[3]) #具有单一分量的数据框
d[[3]]
mode(d[[3]])
typeof(d[[3]])
##-------------------------------------------------------------------------------
##保持字符向量不被强制转换成因子
d <- data.frame(cbind(x = 1, y = 1:10), fac = I(sample(L5, 10, replace = TRUE)), HT = sample(c("H","T"), 10, replace = T))
rbind(class=sapply(d, class), mode=sapply(d, mode))
d <- data.frame(cbind(x = 1, y = 1:10), fac = I(sample(L5, 10, replace = TRUE)), HT = I(sample(c("H","T"), 10, replace = T)))
rbind(class=sapply(d, class), mode=sapply(d, mode))
##-------------------------------------------------------------------------------
##获取数据框结构和统计信息
#创建数据框
(emp.data <- data.frame(emp_id = c (1:5), emp_name = c("Rick","Dan","Michelle","Ryan","Gary"), salary = c(623.3,515.2,611.0,729.0,843.25), 
start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11", "2015-03-27")), stringsAsFactors = FALSE))
#获取数据框结构信息
str(emp.data)
#获取数据框统计信息
print(summary(emp.data))
#从数据框中提取数据
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)
result <- emp.data[1:2,] #提取前两行数据
print(result)
(result <- emp.data[,1:2]) #提取前两列数据，注意列名称
(result <- emp.data[1,2]) #提取某个元素，注意列名称
(result <- emp.data[,2]) #提取某一列的数据，注意列名称
result <- emp.data[c(3,5),c(2,4)] #提取行列交汇处的元素
print(result)
##-------------------------------------------------------------------------------
##扩展数据框
#扩展列
emp.data$dept <- c("IT","Operations","IT","HR","Finance") #添加一列并命名
v <- emp.data
print(v)
#扩展行
emp.data <- data.frame(emp_id = c(1:5),emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
                       salary = c(623.3,515.2,611.0,729.0,843.25),
                       start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11","2015-03-27")),
                       dept = c("IT","Operations","IT","HR","Finance"),
                       stringsAsFactors = FALSE) #创建第一个数据框
emp.newdata <- 	data.frame(emp_id = c(6:8),emp_name = c("Rasmi","Pranab","Tusar"),
                           salary = c(578.0,722.5,632.8),
                           start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17")),
                           dept = c("IT","Operations","Fianance"),
                           stringsAsFactors = FALSE) #创建第二个数据框

#类似矩阵的按行拼接
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)
##-------------------------------------------------------------------------------
##数据框的行列命名
weight = c(150, 135, 210, 140)
height = c(65, 61, 70, 65)
gender = c("Fe","Fe","M","Fe")
study <- data.frame(weight,height,gender) #创建数据框
study
study <- data.frame(w = weight, h = height, g = gender) #创建数据框并更改列名称
study
names(study) <- c("wei","hei","gen") #数据框创建完成后更改列名称
study
(study <- data.frame(weight,height,gender,row.names = c("Mary","Alice","Bob","Judy"))) #创建数据框并更改行名
row.names(study) <- c("Mary_1","Alice_2","Bob_3","Judy_4") #数据框创建完成后更改行名称
study
(ndata <- study[,2]) #选取只涉及单独某列时，输出一个向量，没有列名称
study[,2,drop=F] #保留行列名称
(ndata <- study[2,])
(ndata <- study[,2:3])
##-------------------------------------------------------------------------------
##数据框提取数据举例
(df <- data.frame(a = 1:10,b = 2:11,c = 3:12)) #创建数据框
(df1 <- subset(df, select = c(a,c))) #利用subset函数选取列a和c
(df2 <- subset(df, select = -c(a,c))) #利用subset函数去除列a和c
(df[ ,!(colnames(df) %in% c("a","c"))]) #利用索引去除列a和c
(df[,-match(c("a","c"),names(df))]) #利用match函数去除列a和c
(df[,setdiff(names(df), c("a","c"))]) #利用setdiff函数去除列a和c
(df[,intersect(names(df), c("a","c"))]) #利用intersect函数选取列a和c
##-------------------------------------------------------------------------------
##数据框查询
student <- data.frame(ID = c(11,12,13),Name = c("Devin","Edward","Wenli"),
                      Gender = c("M","M","F"),Birthdate = c("1984-12-29","1983-5-6","1986-8-8"),
                      Age = c(34,35,32))
student
attach(student)
print(Name)
detach(student)
#使用with函数
with(student,{
  n<-Name
  print(n)
  })
str(student)
student$Name<-as.character(student$Name)
student$Birthdate<-as.Date(student$Birthdate)
str(student)
student[which(student$Gender=="F"),]
student[which(student$Gender=="F"),"Name"]
subset(student,Gender=="M" & Age>34 ,select=c("Name","Age"))
install.packages("sqldf")
library(sqldf)
result <- sqldf("select Name, Age from student where Gender='M' and Age>34")
result
##-------------------------------------------------------------------------------
##数据框中的因子
#建立数据框
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")
input_data <- data.frame(height,weight,gender)
print(input_data)
#判断变量是否为因子型
print(is.factor(input_data$gender))
#输出因子型变量gender
print(input_data$gender)
#更改因子的级别顺序
data <- c("East","West","East","North","North","East","West","West","West","East","North")
#创建因子对象
factor_data <- factor(data)
print(factor_data)
#指定因子的级别顺序
new_order_data <- factor(factor_data,levels = c("East","West","North"))
print(new_order_data)
##-------------------------------------------------------------------------------
##数据运算
x1 <- 1:12
x1
x2 <- matrix(1:12,3)
x2
range(x1) #取值范围
sum(x1) #元素求和
range(x2)
sum(x2)
diff(x1,lag = 1,differences = 1) #从第2项开始每项减前第1项
diff(x1,lag = 2,differences = 1) #从第3项开始每项减前第2项
diff(x1,lag = 1,differences = 2) #从第2项开始每项减前第1项并重复多做1次
prod(x1) #所有元素乘积
mean(x2) #所有元素的平均
abs(x1) #每个元素的绝对值
sqrt(x2) #每个元素的正平方根
median(x1) #所有元素的中位数
quantile(x2) #所有元素的四分位数
IQR(x1) #所有元素中间50%元素的区间长度
w <- 12:1
w
weighted.mean(x1,w) #w归一化后与x1的内积
rank(w) #给出w中元素从小到大排序后的位置索引
#rank函数更多举例
(r1 <- rank(x <- c(3, 1, 4, 15, 92)))
y <- c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5)
names(y) <- letters[1:11]
(r2 <- rank(y)) # ties are averaged
#方差、协方差、相关系数
var(x1) #向量的样本方差
var(x2) #列向量的协方差矩阵
sd(x1) #向量方差的正平方根(标准差)
cor(x1,x1)
cor(x2) #列向量的相关系数矩阵
var(x1,x1)
var(x2,x2)
#保留小数点后几位
round(1.345,1) #不进位
round(1.345,2) #不进位
round(1.3451,2) #进1位
#scaling操作
require(stats)
(x <- matrix(1:10, ncol = 2))
(centered.x <- scale(x, scale = FALSE)) #仅中心化到以0为中心，即每项减去均值
(centered.scaled.x <- scale(x)) #中心化后再标准化，即每项减去均值再除以标准差
#定积分运算
integrand1 <- function(x) {x^2}
integrate(integrand1,1,2)
integrand2 <- function(x) {1/((x+1)*sqrt(x))}
integrate(integrand2,0,Inf)
#向量的其它运算
x1 <- 1:12
x2 <- 12:1
pmax(x1,x2) #输出较大元素值
pmin(x1,x2) #输出较小元素值
cumsum(x1) #累积求和（概率分布函数）
cumprod(x2) #累积求积（对数概率分布函数）
cummin(x1) #输出累积（计）最小元素
cummin(x2) 
cummax(x1) #输出累积（计）最大元素
cummax(x2)
#集合运算
x1 <- c('a','b','c')
x2 <- c('b','c','d')
union(x1,x2) #并集
intersect(x1,x2) #交集
setdiff(x1,x2) #集合的差集，x1交上x2的补集
setequal(x1,x2) #集合是否相等的逻辑判断
is.element(x1,x2) #集合（按元素）包含关系的逻辑判断
#复数运算
z<-complex(real = 2, imaginary = 1)
Mod(z)
Arg(z)
Conj(z)
##-------------------------------------------------------------------------------
##数据的选取和操作
x <- rnorm(10,5,5)
x
which.max(x) #返回最大元素的位置
which.min(x) #返回最小元素的位置
sort(x) #升序排列
rev(sort(x)) #降序排列
cut(x, breaks = -5:15, labels = FALSE)
cut(x, breaks = -5:15, labels = LETTERS[1:20])
#游程
x <- rev(rep(6:10, 1:5))
rle(x)
#元素匹配
x <- 1:12
y <- seq(from = 1, to = 12, by = 2)
(z <- match(x,y))
na.fail(z)
(z <- na.omit(z))
na.fail(z)
which(x == 3)
#符号函数
sign(5) #大于0返回1
sign(-5) #小于0返回-1
sign(0) #等于0返回0
sign(rnorm(10)) #产生10个标准正态分布样本并判断它们的符号
#返回唯一值
x <- rep(1:3, 1:3)
x
unique(x) #x的所有值（去除重复）
duplicated(x) #x中元素是否唯一的逻辑判断（第一次出现为TRUE）
table(x) #x中元素的频数表
#表格举例
a <- LETTERS[1:3] #"A","B","C"
(b <- sample(a)) #无放回抽样
table(a, b) #记录每次抽样结果，行名为a，列名为b，并记录频数为1
#表格归一化
m <- matrix(1:4, 2)
m
prop.table(m, 1) #按行归一化
prop.table(m, 2) #按列归一化
prop.table(m) #按所有元素归一化