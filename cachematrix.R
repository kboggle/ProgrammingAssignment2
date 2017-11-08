## The following are the codes for"makCacheMatrix" and "cacheSolve" 


## I generate a random square matrix using the code below and used that to verify my results. 

# A <- matrix(sample.int(10, size = 2*2, replace = TRUE), nrow = 2, ncol = 2)
# print(A)
# m <- makeCacheMatrix(A)
# cacheSolve(m) 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
        ## Return a matrix that is the inverse of 'x'
}
