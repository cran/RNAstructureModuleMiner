internal_loop <- function(ctFile){
  RNAstructure <- matrix(c(as.numeric(ctFile[,5]),as.numeric(ctFile[,6])),ncol = 2,byrow = F)
  internal_loops <- list()
  n <- 1
  boundStart <- 0
  boundEnd <- 0
  boundStart2 <- 0
  boundEnd2 <- 0
  loops <- c()
  for (i in 1:(dim(RNAstructure)[1] - 1)) {
    if(RNAstructure[i,1] != 0 && RNAstructure[i+1,1] == 0){
      boundStart <- i
     }
    if(RNAstructure[i,1] == 0 && RNAstructure[i+1,1] != 0){
      boundEnd <- i + 1
    }
    if(boundStart == 0 && boundEnd != 0){
      boundEnd <- 0
    }
    if(boundStart != 0 && boundEnd !=0){
      #print(paste(boundStart,"_",boundEnd))
      boundStart2 <- RNAstructure[boundStart,1]
      boundEnd2 <- RNAstructure[boundEnd,1]
      num_min <- min(boundStart2,boundEnd2) + 1
      num_max <- max(boundStart2,boundEnd2) - 1
      loop <- RNAstructure[num_min:num_max,1]
      if(length(which(loop != 0)) == 0 && (boundStart + 1) != num_min && (boundEnd - 1) != num_max){
        if(length(which(loops == (min(boundStart,boundEnd) + 1))) == 0){
          loops <- c(loops,boundStart,boundEnd,num_min,num_max)
          internal_loops[[n]] <- sort(c(num_min:num_max,(min(boundStart,boundEnd)+1):(max(boundStart,boundEnd)-1)))
          n <- n + 1
        }
      }
      boundStart <- 0
      boundEnd <- 0
      boundStart2 <- 0
      boundEnd2 <- 0
    }
  }
  return(internal_loops)
}
