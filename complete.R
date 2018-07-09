complete <- function(directory, id = 1:332){
        ## return the number of complete cases in directory folder
        
        ## create an empty data frame-------------------------------------------
        complete <- data.frame(matrix(ncol = 2, nrow = 0))
        colnames(complete) <- c("id", "nobs")
        #-----------------------------------------------------------------------
        
        for(i in id){
                ## get the file name--------------------------------------------
                ## and read the data--------------------------------------------
                if(i < 10){
                        filename <- paste("00",i,".csv", sep = "")
                }
                else if(i < 100){
                        filename <- paste("0",i,".csv", sep = "")
                }
                else{
                        filename <- paste(i,".csv", sep = "")
                }
                filename <- paste(directory, filename, sep = "/")
                data <- read.csv(filename)
                ##--------------------------------------------------------------
                
                complete.data <- data[complete.cases(data),]
                
                new.row <- data.frame("id" = i, "nobs" = nrow(complete.data))
                complete <- rbind(complete, new.row)
                
        }
        ## return complete----------------------------------------------------------
        complete
}