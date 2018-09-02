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


## This function returns the inverse of a matrix like object created by the above function. 
## If the inverse was already computed, it returns the cached value. Otherwise, solve is 
## used to compute the inverse.
cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached inverse")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
