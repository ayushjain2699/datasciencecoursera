## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##The following function takes an optional argument as matrix and return the list of four functions 
##viz set,get,setinverse and getinverse which sets the matrix, returna a matrix, sets the inverse and returns
##the inverse respectively
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set<-function(m)
  {
    i<<-NULL
    x<<-m
  }
  get<-function() x
  setinverse<-function(y) i<<-y
  getinverse<-function() i
  list(set=set,get=get,setinverse = setinverse,getinverse = getinverse)
}


## Write a short comment describing this function
##the following funtion takes the above list as its argument and returns the inverse of the matrix. If the inverse
##already exists then returns that value else computes the inverse, sets the inverse and then return it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i))
  {
    return(i)
  }
  else
  {
    m <- x$get()
    i<-solve(m,...)
    x$setinverse(i)
    i
  }
}
