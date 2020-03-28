##�������ݿ�
L5=LETTERS[1:5] #ǰ�����д��ĸ
#����data.frame���������з��������ݿ�
d <- data.frame(cbind(x = 1, y = 1:10),fac = sample(L5, 10, replace = TRUE))
d
mode(d[1]) #list
mode(d[[1]]) #numeric
length(d[1]) #�б��������
length(d[[1]]) #��ֵ�����ĳ���
d[[2]][3] #���ƾ�������
d[3,2]
d[2,3] #ע����������class��������
class(d[2,3])
##-------------------------------------------------------------------------------
##�ַ�������ǿ��ת��������
d <- data.frame(cbind(x = 1, y = 1:10), fac=sample(L5, 10, replace = TRUE), HT=sample(c("H","T"),10,replace = T))
rbind(class=sapply(d, class), mode=sapply(d, mode))
d[3]
class(d[3]) #���е�һ���������ݿ�
d[[3]]
mode(d[[3]])
typeof(d[[3]])
##-------------------------------------------------------------------------------
##�����ַ���������ǿ��ת��������
d <- data.frame(cbind(x = 1, y = 1:10), fac = I(sample(L5, 10, replace = TRUE)), HT = sample(c("H","T"), 10, replace = T))
rbind(class=sapply(d, class), mode=sapply(d, mode))
d <- data.frame(cbind(x = 1, y = 1:10), fac = I(sample(L5, 10, replace = TRUE)), HT = I(sample(c("H","T"), 10, replace = T)))
rbind(class=sapply(d, class), mode=sapply(d, mode))
##-------------------------------------------------------------------------------
##��ȡ���ݿ�ṹ��ͳ����Ϣ
#�������ݿ�
(emp.data <- data.frame(emp_id = c (1:5), emp_name = c("Rick","Dan","Michelle","Ryan","Gary"), salary = c(623.3,515.2,611.0,729.0,843.25), 
start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11", "2015-03-27")), stringsAsFactors = FALSE))
#��ȡ���ݿ�ṹ��Ϣ
str(emp.data)
#��ȡ���ݿ�ͳ����Ϣ
print(summary(emp.data))
#�����ݿ�����ȡ����
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)
result <- emp.data[1:2,] #��ȡǰ��������
print(result)
(result <- emp.data[,1:2]) #��ȡǰ�������ݣ�ע��������
(result <- emp.data[1,2]) #��ȡĳ��Ԫ�أ�ע��������
(result <- emp.data[,2]) #��ȡĳһ�е����ݣ�ע��������
result <- emp.data[c(3,5),c(2,4)] #��ȡ���н��㴦��Ԫ��
print(result)
##-------------------------------------------------------------------------------
##��չ���ݿ�
#��չ��
emp.data$dept <- c("IT","Operations","IT","HR","Finance") #����һ�в�����
v <- emp.data
print(v)
#��չ��
emp.data <- data.frame(emp_id = c(1:5),emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
                       salary = c(623.3,515.2,611.0,729.0,843.25),
                       start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11","2015-03-27")),
                       dept = c("IT","Operations","IT","HR","Finance"),
                       stringsAsFactors = FALSE) #������һ�����ݿ�
emp.newdata <- 	data.frame(emp_id = c(6:8),emp_name = c("Rasmi","Pranab","Tusar"),
                           salary = c(578.0,722.5,632.8),
                           start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17")),
                           dept = c("IT","Operations","Fianance"),
                           stringsAsFactors = FALSE) #�����ڶ������ݿ�

#���ƾ���İ���ƴ��
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)
##-------------------------------------------------------------------------------
##���ݿ����������
weight = c(150, 135, 210, 140)
height = c(65, 61, 70, 65)
gender = c("Fe","Fe","M","Fe")
study <- data.frame(weight,height,gender) #�������ݿ�
study
study <- data.frame(w = weight, h = height, g = gender) #�������ݿ򲢸���������
study
names(study) <- c("wei","hei","gen") #���ݿ򴴽���ɺ����������
study
(study <- data.frame(weight,height,gender,row.names = c("Mary","Alice","Bob","Judy"))) #�������ݿ򲢸�������
row.names(study) <- c("Mary_1","Alice_2","Bob_3","Judy_4") #���ݿ򴴽���ɺ����������
study
(ndata <- study[,2]) #ѡȡֻ�漰����ĳ��ʱ�����һ��������û��������
study[,2,drop=F] #������������
(ndata <- study[2,])
(ndata <- study[,2:3])
##-------------------------------------------------------------------------------
##���ݿ���ȡ���ݾ���
(df <- data.frame(a = 1:10,b = 2:11,c = 3:12)) #�������ݿ�
(df1 <- subset(df, select = c(a,c))) #����subset����ѡȡ��a��c
(df2 <- subset(df, select = -c(a,c))) #����subset����ȥ����a��c
(df[ ,!(colnames(df) %in% c("a","c"))]) #��������ȥ����a��c
(df[,-match(c("a","c"),names(df))]) #����match����ȥ����a��c
(df[,setdiff(names(df), c("a","c"))]) #����setdiff����ȥ����a��c
(df[,intersect(names(df), c("a","c"))]) #����intersect����ѡȡ��a��c
##-------------------------------------------------------------------------------
##���ݿ��ѯ
student <- data.frame(ID = c(11,12,13),Name = c("Devin","Edward","Wenli"),
                      Gender = c("M","M","F"),Birthdate = c("1984-12-29","1983-5-6","1986-8-8"),
                      Age = c(34,35,32))
student
attach(student)
print(Name)
detach(student)
#ʹ��with����
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
##���ݿ��е�����
#�������ݿ�
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")
input_data <- data.frame(height,weight,gender)
print(input_data)
#�жϱ����Ƿ�Ϊ������
print(is.factor(input_data$gender))
#��������ͱ���gender
print(input_data$gender)
#�������ӵļ���˳��
data <- c("East","West","East","North","North","East","West","West","West","East","North")
#�������Ӷ���
factor_data <- factor(data)
print(factor_data)
#ָ�����ӵļ���˳��
new_order_data <- factor(factor_data,levels = c("East","West","North"))
print(new_order_data)
##-------------------------------------------------------------------------------
##��������
x1 <- 1:12
x1
x2 <- matrix(1:12,3)
x2
range(x1) #ȡֵ��Χ
sum(x1) #Ԫ�����
range(x2)
sum(x2)
diff(x1,lag = 1,differences = 1) #�ӵ�2�ʼÿ���ǰ��1��
diff(x1,lag = 2,differences = 1) #�ӵ�3�ʼÿ���ǰ��2��
diff(x1,lag = 1,differences = 2) #�ӵ�2�ʼÿ���ǰ��1��ظ�����1��
prod(x1) #����Ԫ�س˻�
mean(x2) #����Ԫ�ص�ƽ��
abs(x1) #ÿ��Ԫ�صľ���ֵ
sqrt(x2) #ÿ��Ԫ�ص���ƽ����
median(x1) #����Ԫ�ص���λ��
quantile(x2) #����Ԫ�ص��ķ�λ��
IQR(x1) #����Ԫ���м�50%Ԫ�ص����䳤��
w <- 12:1
w
weighted.mean(x1,w) #w��һ������x1���ڻ�
rank(w) #����w��Ԫ�ش�С����������λ������
#rank�����������
(r1 <- rank(x <- c(3, 1, 4, 15, 92)))
y <- c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5)
names(y) <- letters[1:11]
(r2 <- rank(y)) # ties are averaged
#���Э������ϵ��
var(x1) #��������������
var(x2) #��������Э�������
sd(x1) #�����������ƽ����(��׼��)
cor(x1,x1)
cor(x2) #�����������ϵ������
var(x1,x1)
var(x2,x2)
#����С�����λ
round(1.345,1) #����λ
round(1.345,2) #����λ
round(1.3451,2) #��1λ
#scaling����
require(stats)
(x <- matrix(1:10, ncol = 2))
(centered.x <- scale(x, scale = FALSE)) #�����Ļ�����0Ϊ���ģ���ÿ���ȥ��ֵ
(centered.scaled.x <- scale(x)) #���Ļ����ٱ�׼������ÿ���ȥ��ֵ�ٳ��Ա�׼��
#����������
integrand1 <- function(x) {x^2}
integrate(integrand1,1,2)
integrand2 <- function(x) {1/((x+1)*sqrt(x))}
integrate(integrand2,0,Inf)
#��������������
x1 <- 1:12
x2 <- 12:1
pmax(x1,x2) #����ϴ�Ԫ��ֵ
pmin(x1,x2) #�����СԪ��ֵ
cumsum(x1) #�ۻ���ͣ����ʷֲ�������
cumprod(x2) #�ۻ�������������ʷֲ�������
cummin(x1) #����ۻ����ƣ���СԪ��
cummin(x2) 
cummax(x1) #����ۻ����ƣ����Ԫ��
cummax(x2)
#��������
x1 <- c('a','b','c')
x2 <- c('b','c','d')
union(x1,x2) #����
intersect(x1,x2) #����
setdiff(x1,x2) #���ϵĲ��x1����x2�Ĳ���
setequal(x1,x2) #�����Ƿ���ȵ��߼��ж�
is.element(x1,x2) #���ϣ���Ԫ�أ�������ϵ���߼��ж�
#��������
z<-complex(real = 2, imaginary = 1)
Mod(z)
Arg(z)
Conj(z)
##-------------------------------------------------------------------------------
##���ݵ�ѡȡ�Ͳ���
x <- rnorm(10,5,5)
x
which.max(x) #�������Ԫ�ص�λ��
which.min(x) #������СԪ�ص�λ��
sort(x) #��������
rev(sort(x)) #��������
cut(x, breaks = -5:15, labels = FALSE)
cut(x, breaks = -5:15, labels = LETTERS[1:20])
#�γ�
x <- rev(rep(6:10, 1:5))
rle(x)
#Ԫ��ƥ��
x <- 1:12
y <- seq(from = 1, to = 12, by = 2)
(z <- match(x,y))
na.fail(z)
(z <- na.omit(z))
na.fail(z)
which(x == 3)
#���ź���
sign(5) #����0����1
sign(-5) #С��0����-1
sign(0) #����0����0
sign(rnorm(10)) #����10����׼��̬�ֲ��������ж����ǵķ���
#����Ψһֵ
x <- rep(1:3, 1:3)
x
unique(x) #x������ֵ��ȥ���ظ���
duplicated(x) #x��Ԫ���Ƿ�Ψһ���߼��жϣ���һ�γ���ΪTRUE��
table(x) #x��Ԫ�ص�Ƶ����
#�������
a <- LETTERS[1:3] #"A","B","C"
(b <- sample(a)) #�޷Żس���
table(a, b) #��¼ÿ�γ������������Ϊa������Ϊb������¼Ƶ��Ϊ1
#�����һ��
m <- matrix(1:4, 2)
m
prop.table(m, 1) #���й�һ��
prop.table(m, 2) #���й�һ��
prop.table(m) #������Ԫ�ع�һ��