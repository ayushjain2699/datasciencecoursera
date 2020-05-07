rankall<-function(outcome,num="best")
{
      out = read.csv("outcome-of-care-measures.csv",colClasses = "character")
      out[,11] = as.numeric(out[,11])
      out[,17] = as.numeric(out[,17])
      out[,23] = as.numeric(out[,23])
      if(!(outcome%in%(c("heart failure","heart attack","pneumonia"))))
      {
            stop("invalid outcome")
            return
      }      
      y = split(out,out$State)
      z = sapply(y,rank,outcome = outcome,num = num)
      z = t(z)
}