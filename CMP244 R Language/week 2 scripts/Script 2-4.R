#Data Frame
patientID <- c(1:4)
age <- c(25,34,28,52)
diabetes <- c('Type1','Type2','Type1','Type1')
status <- c('Poor','Improved','Excellent','Poor')
patientdata <- data.frame(patientID,age,diabetes,status)
patientdata
patientdata[1:2]
patientdata[c('age','status')]
patientdata <- data.frame(patientID,age,diabetes,status,row.names=patientID)
patientdata
patientdata$diabetes
table(patientdata$age,patientdata$diabetes)
attach(patientdata)
table(diabetes,status)
detach(patientdata)