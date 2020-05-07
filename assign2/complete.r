complete<-function(id)
{
  filenames=list.files()
  x =rbindlist(lapply(filenames, fread))
  x = as.data.frame(x)
  y = x %>%
  mutate(complete = complete.cases(x)) %>%
  group_by(ID) %>%
  summarise(nobs = sum(complete))
  z = y[id,]
}