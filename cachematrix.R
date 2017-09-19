## The combination of these functions allows you to inverse matrixes effectively...
## Specifically - once you create and inverse a matrix with this function pairing, you save time every next retrieval of the inverse because you retrieve the results from cache without having to recalculate repeatedly

## Put your matrix into makeCacheMatrix() and store it into a variable, remember the name!

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverseMatrix <- function(inverseMatrix) m <<- inverseMatrix
    getinverseMatrix <- function() m
    list(set = set, get = get,
         setinverseMatrix = setinverseMatrix,
         getinverseMatrix = getinverseMatrix)

}


## Perform cacheSolve() on the matrix you just stored. Use this instead of solve() and you will be done quicker if you've already performed it!

cacheSolve <- function(x, ...) {
          m <- x$getinverseMatrix()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverseMatrix(m)
    m
}
