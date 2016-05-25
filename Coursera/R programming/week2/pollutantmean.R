setwd("C://users//shub/Desktop/")
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  # initialize a vector to hold the pollutant data
  allPollutants <- c()
  # set data directory
  dataFilesDirectoryPath <- paste(directory,"/",sep="")
  # find all files in the specdata folder
  allDataFilesNames <- as.character( list.files(dataFilesDirectoryPath) )
  allDataFilePaths <- paste(dataFilesDirectoryPath, allDataFilesNames, sep="")
  for(i in id) {
    dataFrame <- read.csv(allDataFilePaths[i], header=T, sep=",")
    allPollutants <- c(allPollutants,dataFrame[, pollutant] )
  }
  result <- mean(allPollutants,na.rm=TRUE)
  result
}