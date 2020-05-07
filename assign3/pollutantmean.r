pollutantmean<-function(pollutant,id = 1:332)
{
   filenames=list.files()
   x =rbindlist(lapply(filenames, fread))
   x = as.data.frame(x)
   c = x[,4]%in%id
   data = x[c,pollutant]
   m = mean(data,na.rm=T)
   m
}