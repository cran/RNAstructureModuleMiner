\name{compare}
\alias{compare}
\title{compare}
\usage{
compare(ctFile1,ctFile2)
}
\arguments{
\item{ctFile1}{A RNA secondary structure file without the first line of free energy information}
\item{ctFile2}{A RNA secondary structure file without the first line of free energy information}
}
\description{
return similarity score of two RNA secondary structure
}
\value{
Returns a numerical value which represent the similarity of the two RNA secondary structures.The larger the value, the more similar the two RNA structures are.The maximum value is 10, representing the two RNA secondary structures exactly the same,and 0 is the minmum value.
}
\examples{
###
col1 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
col2 <- c("G","A","A","G","A","T","C","A","T","G","C","A","G","T","C","A","T","C","A","G")
col3 <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
col4 <- c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,0)
col5 <- c(18,17,0,15,14,13,0,0,0,0,0,0,6,5,4,0,2,1,0,0)
col6 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)

col1_2 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13)
col2_2 <- c("G","A","C","U","G","G","G","G","C","G","G","U","C")
col3_2 <- c(0,1,2,3,4,5,6,7,8,9,10,11,12)
col4_2 <- c(2,3,4,5,6,7,8,9,10,11,12,13,0)
col5_2 <- c(13,12,11,10,9,0,0,0,5,4,3,2,1)
col6_2 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13)
data1 <- matrix(c(col1,col2,col3,col4,col5,col6),byrow=FALSE,ncol = 6)
data2 <- matrix(c(col1_2,col2_2,col3_2,col4_2,col5_2,col6_2),byrow=FALSE,ncol = 6)
compare(data1,data2)
}
