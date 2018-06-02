## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
## Matrix inversion is usually a costly computation and
## there may be some benefit to caching the inverse of a matrix  
## rather than computing it repeatedly 
## The following functions:

## 1. makeCacheMatrix This function creates a special
## "matrix" object that can cache its inverse

## 2.  cacheSolve computes the inverse of the special "matrix"
##     returned by makeCacheMatrix
##    If the inverse has already been calculated
##    (and the matrix has not changed),then 
##    cacheSolve should retrieve the inverse from the cache.

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

##   cacheSolve computes the inverse of the special "matrix"
##    returned by makeCacheMatrix
##    If the inverse has already been calculated
##    (and the matrix has not changed),then 
##    cacheSolve should retrieve the inverse from the cache.



cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data.")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
}

## Example
#### First run 
## y=c(2,4,1,1)
## x=matrix(y,ncol=2) 
## m=makeCacheMatrix(x)
#### cacheSolve(m)
## computes the inverse in the first run

## > cacheSolve(m)
##     [,1] [,2]
## [1,] -0.5  0.5
