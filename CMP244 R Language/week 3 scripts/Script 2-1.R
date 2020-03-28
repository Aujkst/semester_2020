#Build Matrix
y <- matrix(1:20,nrow=5,ncol=4)
y
cells <- c(40,10,20,30)
rnames <- c('R0','R1') #R=Real
cnames <- c('P0','P1') #P=Predicted
mymatrix1 <- matrix(cells,nrow=2,ncol=2,byrow=TRUE,dimnames=list(rnames,cnames))
mymatrix1
mymatrix2 <- matrix(cells,nrow=2,ncol=2,dimnames=list(cnames,rnames)) #note the difference with mymatrix1
mymatrix2