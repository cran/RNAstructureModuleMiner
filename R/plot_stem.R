##plot hairpin loops
plot_stem <- function(ctFile){

  dot <- ct2dot(ctFile)
  ct <- makeCt(dot[[1]][1],dot[[2]][1])
  co <- ct2coord(ct)

  loops <- stem(ctFile)

  arr_min <- c()
  arr_max <- c()

  if(length(loops) != 0){
    for (i in 1:length(loops)) {
      arr_min <- c(arr_min,loops[[i]][1])
      if(length(loops[[i]]) > 1){
        for (j in 2:length(loops[[i]])) {
          if(loops[[i]][j-1] == loops[[i]][j] - 1){

          }else{
            arr_max <- c(arr_max,loops[[i]][j-1])
            arr_min <- c(arr_min,loops[[i]][j])
          }
        }
        arr_max <- c(arr_max,loops[[i]][j])
      }else{
        arr_max <- c(arr_max,loops[[i]][1])
      }

    }

    ranges=data.frame(min=arr_min,max=arr_max,col=c(2),
                      desc="stems"
    )
    RNAPlot(co,ranges,labTF=F)
    print("------------------------------------------------------")
    print("summary of stems:")
    print(paste("the number of stems is:",length(loops)))
    print(paste("the bases in stems are:",paste(unlist(loops),collapse = " ",sep = "")))
    loops_name <- c()
    for (i in 1:length(loops)) {
      loops_name <- c(loops_name,paste("bases in stem ",i))
    }
    names(loops) <- loops_name
    return(loops)
  }

}


