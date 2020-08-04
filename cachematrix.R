setwd('C:/Users/ceire/Documents/R Course')
##
## I set input x as a matrix
## I set inversed value i to null
## I changed references of mean to inversed
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInversed <- function(solveMatrix) i <<- solveMatrix
  getInversed <- function() i
  list(set = set, get = get, setInversed = setInversed, getInversed = getInversed)
}
##
## Here I changed mean to invedrsed and m to i
cacheSolve <- function(x, ...) {
  i <- x$getInversed()
  if(!is.null(i)) {
    message("getting cached inversed matrix")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setInversed(i)
  i
}
