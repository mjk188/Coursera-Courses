setwd("C://users//shub/Desktop/")
complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # set data directory
  dataFilesDirectoryPath <- paste(directory,"/",sep="")
  #creating an empty dataFrame for appending the later results
  resultDataFrame<- data.frame(id=integer(),nobs=integer())
  
  # find all files in the specdata folder
  allDataFilesNames <- as.character( list.files(dataFilesDirectoryPath) )
  allDataFilesPaths <- paste(dataFilesDirectoryPath, allDataFilesNames, sep="")
  for (i in id) {
    dataFrame <- read.csv(allDataFilesPaths[i], header=T, sep=",")
    NonNAObservations <- sum(complete.cases(dataFrame))
    observation<-c(i,NonNAObservations)
    resultDataFrame<-rbind(resultDataFrame,observation)
  }
  colnames(resultDataFrame)<-c("id","nobs")
  return(resultDataFrame)
} 

