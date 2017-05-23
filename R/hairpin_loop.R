###hairpin_loop
hairpin_loop <- function(ctFile){
  RNAstructure <- matrix(c(as.numeric(ctFile[,5]),as.numeric(ctFile[,6])),ncol = 2,byrow = F)
  arr_line <- c()
  arr0 <- RNAstructure[,1]
  hairpin_loops <- list()
  n <- 1
  for(i in 1:dim(RNAstructure)[1]){
    num_min <- min(RNAstructure[i,1],RNAstructure[i,2])
    num_max <- max(RNAstructure[i,1],RNAstructure[i,2])
    arr <- arr0[(num_min+1):(num_max-1)]
    if(num_min != 0 && num_max != 0 && length(which(arr != 0)) == 0){
      line <- paste(RNAstructure[i,1],"_",RNAstructure[i,2])
      line2 <- paste(RNAstructure[i,2],"_",RNAstructure[i,1])
      arr_line <- c(arr_line,line)
      if(length(which(arr_line == line2))==0){
        hairpin_loops[[n]] <- (num_min+1):(num_max-1)
        n <- n + 1
      }
    }
  }

  return(hairpin_loops)
}
