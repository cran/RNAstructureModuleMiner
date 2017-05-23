\name{internal_loop}
\alias{internal_loop}
\title{Get Internal Loop}
\usage{
internal_loop(ctFile)
}
\arguments{
\item{ctFile}{A RNA secondary structure file without the first line of free energy information}
}
\description{
Given a RNA secondary structure,it compute internal loops in the RNA secondary structure
}
\value{
Return a list containing base positions in internal loops,and the length of the number of internal loops
}
\examples{
###
col1 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
col2 <- c("G","A","A","G","A","T","C","A","T","G","C","A","G","T","C","A","T","C","A","G")
col3 <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
col4 <- c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,0)
col5 <- c(18,17,0,15,14,13,0,0,0,0,0,0,6,5,4,0,2,1,0,0)
col6 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
data <- matrix(c(col1,col2,col3,col4,col5,col6),byrow=FALSE,ncol =6)
internal_loop(data)
}
