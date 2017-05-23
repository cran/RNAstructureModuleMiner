stem <- function(ctFile){
  RNAstructure <- matrix(c(as.numeric(ctFile[,5]),as.numeric(ctFile[,6])),ncol = 2,byrow = F)
  stem_list <- list()
  n <- 0
  stem_arr <- c()
  for (i in 2:dim(RNAstructure)[1]) {
    if(RNAstructure[i-1,1] !=0 && RNAstructure[i,1] != 0 && abs(RNAstructure[i-1,1] - RNAstructure[i,1]) == 1 && abs(RNAstructure[i-1,2] - RNAstructure[i,2]) == 1){
      stem_arr <- c(stem_arr,RNAstructure[i-1,1],RNAstructure[i-1,2],RNAstructure[i,1],RNAstructure[i,2])
    }else{
      if(RNAstructure[i,1] != 0 && length(stem_arr) != 0){
        n <- n + 1
        stem_arr <- unique(stem_arr)
        stem_arr <- sort(stem_arr)
        stem_list[n][[1]] <- stem_arr
        stem_arr <- c()

      }
        }
  }
  if(length(stem_arr) !=0 ){
    n <- n + 1
    stem_arr <- unique(stem_arr)
    stem_arr <- sort(stem_arr)
    stem_list[n][[1]] <- stem_arr
  }
  stem_list <- unique(stem_list)
  return(stem_list)
}
