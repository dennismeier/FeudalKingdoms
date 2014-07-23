powerstates<-function(){
## Read NAICS table
  naicstable<-read.csv("NAICS.csv", header=TRUE)
  naics<-naicstable[,"NAICS.id"]
  naics<-as.character(naics)
## Read the BP table 
  mydata<-read.csv("BP_2012_00A1_with_ann.csv",header=TRUE)
##subset by the supplied NAICS vector
  power<-mydata[mydata$NAICS.id %in% naics,c("GEO.display.label","NAICS.id","NAICS.display.label","EMP")]
}