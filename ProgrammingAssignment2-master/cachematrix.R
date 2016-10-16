## Put comments here that give an overall description of what your
## functions do

#### Brijesh Comments: These functions will cache the inverse of a matrix, 
####                   as per the assignment description.


## Write a short comment describing this function
#### Brijesh Comments: This function creates a special "matrix" object 
####                   that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
          inverse <- NULL
          set <- function(y) {
            x <<- y
            inverse <<- NULL
          }
          get <- function() x
          setinverse <- function(inverse_final) inverse <<- inverse_final
          getinverse <- function() inverse
          list(set = set, get = get,
               setinverse = setinverse,
               getinverse = getinverse)
}


## Write a short comment describing this function
#### Brijesh Comments: This function computes the inverse of the special 
####                   "matrix" returned by makeCacheMatrix.

cacheSolve <- function(x, ...) {
          inverse <- x$getinverse()
          if(!is.null(inverse)) {
            message("getting cached data")
            return(inverse)
          }
          data <- x$get()
          inverse <- solve(data, ...)
          x$setinverse(inverse)
          inverse
}

matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
matrix$get()
matrix$getinverse()
cacheSolve(matrix)
cacheSolve(matrix)
