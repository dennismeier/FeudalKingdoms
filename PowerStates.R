powerstates<-function(){
## Read NAICS table
  naicstable<-read.csv("NAICS.csv", header=TRUE)
  naics<-naicstable[,"NAICS.id"]
## Define a string of EMP values to convert to NAs during read
  ## and then collect only complete casesstr
  nastring<-c("a","b","c","d","e","f","g","h","i","j","k","l")
## Read the BP table 
  alldata<-read.csv("BP_2012_00A1_with_ann.csv",header=TRUE,na.string=nastring)
  mydata<-na.omit(alldata)
## print(str(mydata))
## Get rid of businesses with fewer than 500 employees
  largeco<-mydata[ which(as.numeric(mydata$EMP)==500),]
##  print(str(largeco))
## Subset by the supplied NAICS vector
  power<-largeco[largeco$NAICS.id %in% naics,c("GEO.display.label","NAICS.id","NAICS.display.label","EMP")]
  print(str(power))
  print(head(power,n=25))
  write.csv(power,file="kingdoms.csv")
}