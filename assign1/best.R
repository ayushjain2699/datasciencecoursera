best<-function(state,outcome)
{
      out = read.csv("outcome-of-care-measures.csv",colClasses = "character")
      out[,11] = as.numeric(out[,11])
      out[,17] = as.numeric(out[,17])
      out[,23] = as.numeric(out[,23])
      if(!(state%in%out$State))
      {
            stop("invalid state")
            return
      }
      if(!(outcome%in%(c("heart failure","heart attack","pneumonia"))))
      {
            stop("invalid outcome")
            return
      }      
      y = split(out,out$State)
      data = y[[state]]
      if(outcome=="heart attack")   y_cor = 11
      if(outcome=="heart failure")   y_cor = 17
      if(outcome=="pneumonia")   y_cor = 23
      m=min(data[,y_cor],na.rm=T)
      z = data[data[,y_cor]==m,2]
      z = z[complete.cases(z)]
      z = min(z)
}