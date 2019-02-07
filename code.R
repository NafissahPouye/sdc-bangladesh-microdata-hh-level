#Load required packages
library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #for data cleaning if needed before the SDC process

#Import microdata
setwd("C:/Users/LENOVO T46OS/Desktop/sdc-bangladesh-microdata1") #set working directory
data <- read_excel("data.xlsx")

#Classify variables 
#Select key variables
selectedKeyVars <- c('Q6', 'Q7', 'Q10', 'Q11', 'Q12', 'Q13','Q14')
                    
#Convert variables to factor
cols = c('Q6', 'Q7', 'Q10', 'Q11', 'Q12', 'Q13','Q14')
data[,cols] <- lapply(data[,cols], factor)

#Set subset of file with key variables
fileRes<-data[,selectedKeyVars]
fileRes <- as.data.frame(fileRes)

#Create a SDC object
objSDC <- createSdcObj(dat = fileRes, keyVars = selectedKeyVars)

#Print the global risk
print(objSDC, "risk")

#Generating an internal (extensive) report
report(objSDC, filename = "index", internal = TRUE) 


