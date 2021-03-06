## Functions to create a new matrix object, create the inverse and cache the inverse

## This function creates an initial matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
}
set <- function(y) {
  x <<- y
 m <<- NULL
}

get <- function() x
setInverse <- function(solveMatrix) m <<- solveMatrix
getInverse <- function() m
list(set = set, get = get,
     setInverse = setInverse,
     getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

cachesolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
