pollutantmean <- function(directory, pollutant, id = 1:332){
        ## directory : location of csv files (character)
        ## pollutant : either 'sulfate' or 'nitrate'
        ## id : monitor id (integer)
        
        ## return pollutant across all monitors list ignoring NAs
        
        ##======================================================================
        sum <- 0
        count <- 0
        for(i in id){
                
                ## get the file name--------------------------------------------
                if(i < 10){
                        filename <- paste("00",i,".csv", sep = "")
                }
                else if(i < 100){
                        filename <- paste("0",i,".csv", sep = "")
                }
                else{
                        filename <- paste(i,".csv", sep = "")
                }
                filedirectory <- paste(directory, filename, sep = "/")
                ## calculate the sum of pollutant in this file------------------
                data.thisfile <- read.csv(filedirectory)
                pollutant.thisfile <- data.thisfile[[pollutant]]
                ## get rid of NAs and count data numbers
                pollutant.thisfile <- 
                        pollutant.thisfile[!is.na(pollutant.thisfile)]
                count <- count + length(pollutant.thisfile)
                ## sum the pollutant--------------------------------------------
                sum <- sum + sum(pollutant.thisfile)
        }
        ## return mean of sum--------------------------------------------------
        sum/count
        ##======================================================================
}