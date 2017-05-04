## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This function wraps your matrix in a structure that allows you to
# recover the original matrix, and calculate and cache the inverted matrix.
makeCacheMatrix <- function(x = matrix()) {
  cachedInverse <- NULL
  getMatrix     <- function ()  x
  inverse       <- function ()  cacheSolve(l)
  getInverse    <- function ()  cachedInverse
  setInverse    <- function (i) cachedInverse <<- i

  l <- list(getMatrix = getMatrix, inverse = inverse, setInverse = setInverse, getInverse = getInverse)

  l
}


## Given a "cache matrix" structure as defined above, will
# compute and cache a matrix inverse, or return a previously-cached
# inverse matrix.
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
