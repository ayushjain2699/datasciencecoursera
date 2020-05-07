corr<-function(threshold=0)
{
    filenames=list.files()
    x =rbindlist(lapply(filenames, fread))
    x = as.data.frame(x)
    x = x[complete.cases(x[,2:3]),]
    y = x %>%
      group_by(ID) %>%
      summarise(corr = cor(x=sulfate,y=nitrate))
    z1 = complete(1:332)
    z1 = z1[z1[,2]!=0,]
    c = z1[,2]>threshold
    z = y[c,2]
    z[[1]]
}
