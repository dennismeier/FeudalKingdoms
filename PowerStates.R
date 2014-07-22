powerstates<-function(){
## Read NAICS table
  naicstable<-read.csv("NAICS.csv", header=TRUE)
  naics<-subset(naicstable, select=NAICS.id)
  naics<-as.character(naics)
## Read the BP table 
  mydata<-read.csv("BP_2012_00A1_with_ann.csv",header=TRUE)
##subset by the supplied NAICS vector
  print(str(mydata))
  power<-mydata[mydata$NAICS %in% naics, ]
}