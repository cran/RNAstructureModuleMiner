####multi_branch_loop
multi_branch_loop <- function(ctFile){
  RNAstructure <- ctFile
  a_hairpin <- unlist(hairpin_loop(RNAstructure))
  a_bulge <- unlist(bulge_loop(RNAstructure))
  a_internal <- unlist(internal_loop(RNAstructure))
  RNAstructure <- matrix(c(as.numeric(RNAstructure[,5]),as.numeric(RNAstructure[,6])),ncol = 2,byrow = F)
  pair <- which(RNAstructure[,1] != 0)
  other <- c(a_hairpin,a_bulge,a_internal,pair)
  multi_loop <- setdiff(c(1:dim(RNAstructure)[1]),other)
  if(length(multi_loop) != 0){
    if(length(which(multi_loop == 1)) !=0){
      num <- 1
      while(length(which(multi_loop == num)) != 0) {
        multi_loop <- multi_loop[2:length(multi_loop)]
        num <- num + 1
      }
    }
    if(length(which(multi_loop == dim(RNAstructure)[1])) != 0){
      num <- dim(RNAstructure)[1]
      while (length(which(multi_loop == num)) != 0) {
        multi_loop <- multi_loop[1:(length(multi_loop) - 1)]
        num <- num - 1
        }
    }
    links <- list()
    links_index <- 0
    for (i in 1:dim(RNAstructure)[1]) {
      if(RNAstructure[i,1] != 0){
        links_index <- links_index + 1
        links[[links_index]] <- c(RNAstructure[i,1],RNAstructure[i,2])
      }
    }
    length2 <- length(links) - 1
    while(length(links) != length2){
      length2 <- length(links)
      for (j in 1:length(links)) {
        for (k in 1:length(links)) {

          a <- min(links[[j]])
          b <- max(links[[j]])
          c <- min(links[[k]])
          d <- max(links[[k]])
          if((abs(a-c)==1&&abs(b-d)!=1)||(abs(a-d)==1&&abs(b-c)!=1)||(abs(b-c)==1&&abs(a-d)!=1)||(abs(b-d)==1&&abs(a-c)!=1)){
            links_index <- links_index + 1
            links[[links_index]] <- c(a,b,c,d)
            links <- unique(links)
            for (m in 1:length(links)) {
              if(length(links[m][[1]])==0){
                links[m]<- NULL
              }
            }
            links <- unique(links)

          }
        }
      }
    }

    multi_loops <- list()
    n <- 1
    loop_arr <- c()
    multi_loop <- multi_loop[!is.na(multi_loop)]
    multi_loop_lengh <- length(multi_loop)
    loop_arr <- c(loop_arr,multi_loop[1])
    multi_loop <- multi_loop[2:length(multi_loop)]
    while (length(multi_loop) != 0 && length(multi_loop) != multi_loop_lengh) {

      multi_loop_lengh <- length(multi_loop)
      multi_loop <- sort(multi_loop)
      test <- 0
      if(multi_loop[1] == loop_arr[length(loop_arr)] + 1){
        loop_arr <- c(loop_arr,multi_loop[1])
        multi_loop <- multi_loop[2:length(multi_loop)]
        multi_loop <- sort(multi_loop)
        test <- 1
      }else{
        for (index_bridge in 1:length(links)) {
          link_max <- max(links[index_bridge][[1]])
          link_min <- min(links[index_bridge][[1]])
          if(multi_loop[1] -1 == link_max && loop_arr[length(loop_arr)] + 1 == link_min){
            loop_arr <- c(loop_arr,multi_loop[1])
            multi_loop <- multi_loop[2:length(multi_loop)]
            multi_loop <- sort(multi_loop)
            test <- 1
          }
        }
      }
      if(test ==0){

        loop_arr <- c(multi_loop[1])
        multi_loop <- multi_loop[2:length(multi_loop)]
        multi_loop <- sort(multi_loop)
      }else if(test == 1){
        for (index_bridge2 in 1:length(links)) {
          arr_max <- max(loop_arr)
          arr_min <- min(loop_arr)
          if((length(which(links[index_bridge2][[1]] == (arr_max+1)))!=0)&&(length(which(links[index_bridge2][[1]] == (arr_min-1)))!=0)){
            multi_loops[[n]] <- loop_arr
            n <- n + 1
          }
        }
      }
    }
    multi_loops <- unique(multi_loops)
  }else{
    multi_loops <- list()
  }
  return(multi_loops)
}
