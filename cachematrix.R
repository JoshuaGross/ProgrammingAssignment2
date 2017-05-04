## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  cachedInverse <- NULL
  getMatrix     <- function ()  x 
  inverse       <- function ()  cacheSolve(x)
  getInverse    <- function ()  cachedInverse
  setInverse    <- function (i) cachedInverse <<- i
  
  list(getMatrix = getMatrix, inverse = inverse, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  if (is.null(x$getInverse())) {
    x$setInverse(solve(x$getMatrix(), ...))
  }
  
  x$getInverse()
}

# test:
# hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
# h8 <- hilbert(8)
# cm <- makeCacheMatrix(h8)