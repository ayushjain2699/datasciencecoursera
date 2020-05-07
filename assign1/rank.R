rank<-function(x,outcome,num="best")
{
      
      state = x[1,7]
      if(outcome=="heart attack")   y_cor = 11
      if(outcome=="heart failure")   y_cor = 17
      if(outcome=="pneumonia")   y_cor = 23
      final = x[,c(2,y_cor)]
      final = final[complete.cases(final[,2]),]
      final = final[order(final[,2],final[,1]),]
      if(num=="best")   num = 1
      if(num=="worst")  num = nrow(final)
      if(nrow(final)<num)      return 
      a = final[num,1]
      c("name"=a,"State"=state)
}