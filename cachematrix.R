## These functions are used to create a square matrix like object that caches its inverse.
## If the cached inverse is no longer in storage when it's requested, such as on the first request,
## then the inverse is calculated and put in storage.

## This function creates and returns a matrix like object based on the provided real matrix. 
## The created matrix like object stores its own inverse and provides methods for getting and setting 
## the original real matrix and it's stored inverse.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) i <<- inv
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
