##bulge_loop
bulge_loop <- function(ctFile){
  RNAstructure <- matrix(c(as.numeric(ctFile[,5]),as.numeric(ctFile[,6])),ncol = 2,byrow = F)
  #print(RNAstructure)
  bulge_loops <- list()
  n <- 1
  arr0 <- RNAstructure[,1]
  for(i in 1:(length(arr0)-1)){
  loop_length <- abs(arr0[i] - arr0[i + 1])
  num_min <- min(arr0[i],arr0[i+1]) + 1
  num_max <- max(arr0[i],arr0[i+1]) - 1
  if(arr0[i] !=0 && arr0[i+1] !=0 && loop_length != 1 && length(which(arr0[num_min:num_max] !=0 )) == 0){
      bulge_loops[[n]] <- num_min:num_max
      n <- n + 1
    }
  }
  return(bulge_loops)
}
