## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This fuction will create a object that contain a matrix and cache its inverse. This fuctions satisfies the requirement that 
##to creates a special "vector", which is really a list containing a function to

## 1. set the value of the vector
## 2. get the value of the vector
## 3. set the value of the mean
## 4. get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
  set <- function(y) {
          x <<- y
          i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## This fuction calculate the inverse of the matrix that was created by the fuction noted above 

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
          message("getting cached data")
          return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}

A <- matrix( c(5, 1, 0,
                   3,-1, 2,
                   4, 0,-1), nrow=3, byrow=TRUE)
A1 <- makeCacheMatrix(A)
cacheSolve(A1) 
