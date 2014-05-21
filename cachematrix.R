## cachematrix saves time and resource of matrix invert calculation 
## by caching the invert of matrix. To achieve this, it creates a 
## special matrix that stores matrix values and its invert. 

## Michael Hartley's forum post was greatly helpful:
## https://class.coursera.org/rprog-003/forum/thread?thread_id=511

## makeCacheMatrix: Creates a matrix object that can cache its inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL    # <<- To change it in parent environment, too
        }
        get <- function() x    # get original matrix
        setinvert <- function(solve) inv <<- solve    # cache the inverse matrix
        getinvert <- function() inv    # return the inverse matrix
        list(set = set, get = get,
             setinvert = setinvert,
             getinvert = getinvert)
}


## cacheSolve: Computes the inverse of the matrix returned by makeCacheMatrix().
## If the inverse has already been calculated and the matrix has not changed,
## then it retrieves the inverse from cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinvert()    # trying to retrieve a inverse matrix
        if(!is.null(inv)) {    # if there is already an inverse,
                message("getting cached data")
                return(inv)
        }
        data <- x$get()    # set matrix into data
        inv <- solve(data, ...) # calculate inverse matrix using solve()
        x$setinvert(inv)    # save the inverse into the cache
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

