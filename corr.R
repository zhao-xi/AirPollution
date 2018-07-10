corr <- function(directory, threshold = 0){
        ## directory : where the files are
        ## threshold : complete cases should be larger than this number
        
        corr <- c() # this is the vector that we'll return
        
        filename.vector <- dir(directory)
        complete.ob <- complete(directory)
        complete.ob <- complete.ob["nobs"] # the vector of number of complete
                                          # cases of every file
        
        for(i in 1:length(filename.vector)){
                filename <- filename.vector[i]
                filepath <- paste(directory, filename, sep = "/")
                
                if(complete.ob[i,] >= threshold){
                        ## get the complet cases--------------------------------
                        data <- read.csv(filepath)
                        data <- data[complete.cases(data),]
                        ##------------------------------------------------------
                        
                        correlation <- cor(data["sulfate"], data["nitrate"])
                        corr <- c(corr, correlation)
                }
        }
        corr
        
}