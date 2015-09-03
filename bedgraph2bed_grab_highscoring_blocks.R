x <- read.delim('input_bedgraph.bedgraph',header=F)

# call function
bedGraphtobed(x)

# function definition
bedGraphtobed <- function(bedGraph)
{
  start <- data.frame()
  end <- data.frame()
  j <- 1
  i <- 1
  while(i<nrow(bedGraph))
  {
    if(bedGraph[i,4]>0.5)
    {
      start <- rbind(start,bedGraph[i,2])
      j <- i+1
      # print(j)
      while(bedGraph[j,4]>0.5)
      {
        j <- j+1
        # print(j)
      }
      end <- rbind(end,bedGraph[j-1,3])
      i <- j+1
    }
    if(bedGraph[i,4]<0.5)
    {
      i <- i+1
    }
  }
  dat <- cbind(start,end)
  colnames(dat)[1] <- "Start"
  colnames(dat)[2] <- "End"
  dat$chr <- as.character(bedGraph[1,1])
  dat <- dat[,c(3,1,2)]
  write.table(dat,"output.bed")
}
