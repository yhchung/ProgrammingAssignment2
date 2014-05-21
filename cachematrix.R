## cachematrix saves time and resource of matrix invert calculation 
## by caching the invert of matrix. To achieve this, it creates a 
## special matrix that stores matrix values and its invert. 

## makeCacheMatrix: Creates a matrix object that can cache its inverse matrix.

makeCacheMatrix <- function(x = matrix()) {

}


## cacheSolve: Computes the inverse of the matrix returned by makeCacheMatrix().
## If the inverse has already been calculated and the matrix has not changed,
## then it retrieve the inverse from cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
