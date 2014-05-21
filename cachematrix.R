## cachematrix saves time and resource of matrix invert calculation 
## by caching the invert of matrix. To achieve this, it creates a 
## special matrix that stores matrix values and its invert. 

## makeCacheMatrix: Creates a matrix object that can cache its inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinvert <- function(solve) inv <<- solve
        getinvert <- function() inv
        list(set = set, get = get,
             setinvert = setinvert,
             getinvert = getinvert)

}


## cacheSolve: Computes the inverse of the matrix returned by makeCacheMatrix().
## If the inverse has already been calculated and the matrix has not changed,
## then it retrieve the inverse from cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinvert()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinvert(inv)
        inv
}


# Example run
# a <- makeCacheMatrix()
# a
# class(a)
# class(a$set)
# a$set(matrix(1:4,2,2))
# a$get()
# cacheSolve(a)
# cacheSolve(a) # "getting cached data"
# solve(matrix(1:4,2,2)) # checking invert matrix by solve()

