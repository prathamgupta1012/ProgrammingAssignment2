#I have made two types of code, they both work you can see the working codes I have placed in the bottom.  
#Code 1 is compact.
#Code 2 is more readable.

#Code 1.
#These functions help the user save time by caching the inverse of a matrix.
#If it is not already set it can calculate and then cache the inverse hence allowing the user to decrease the computational power by caching it and not re-calculating the inverse everytime the user wants to use it.
#This function has many internal functio which can be accessed by the user after storing it in an object after calling it with parameters.
makeCacheMatrix <- function(x = matrix())
{
    inverse <- NULL#Setting the inverse of the matrix to NULL so that no garbage value is returned.
    list(set = function(y){
        x <<- y     #Setting the new matrix.
        inv <<- NULL#Setting it back to NULL so that after a new matrix is set and the user wants to get the 'getInverse' it should not return the old matrices inverse.
    },get = function(){
        return(x)#Returing the user the currently set matrix.
    },getInverse = function(){
        if (!is.null(inverse))#Checking if the inverse in NULL.
            return(inverse)#Returning the user the inverse of the currently set matrix which is already set in variable inverse and not re-calculating it.
        return(cacheSolve(x))})#This will only get executed if inverse is null hence saving computational power by not calculating the inverse of the matrix everytime.
}
#This function calculates the returns the inverse of a matrix.
cacheSolve <- function(x)## Return a matrix that is the inverse of 'x'
    return(solve(x))#Solving the matrix ie, getting its inverse.


#Code 2.
#These functions help the user save time by caching the inverse of a matrix.
#If it is not already set it can calculate and then cache the inverse hence allowing the user to decrease the computational power by caching it and not re-calculating the inverse everytime the user wants to use it.
#This function has many internal functio which can be accessed by the user after storing it in an object after calling it with parameters.
makeCacheMatrix <- function(x = matrix())
{
    inverse <- NULL#Setting the inverse of the matrix to NULL so that no garbage value is returned.
    set <- function(y)
    {
        x <<- y     #Setting the new matrix.
        inv <<- NULL#Setting it back to NULL so that after a new matrix is set and the user wants to get the 'getInverse' it should not return the old matrices inverse.
    }
    get <- function()
    {
        return(x)#Returing the user the currently set matrix.
    }
    getInverse <- function()
    {
        if (!is.null(inverse))#Checking if the inverse in NULL.
            return(inverse)#Returning the user the inverse of the currently set matrix which is already set in variable inverse and not re-calculating it.
        return(cacheSolve(x))#This will only get executed if inverse is null hence saving computational power by not calculating the inverse of the matrix everytime.
    }
    list(set = set,get = get,getInverse = getInverse)
}
#This function calculates the returns the inverse of a matrix.
cacheSolve <- function(x)
{
    ## Return a matrix that is the inverse of 'x'
    inverse <- solve(x)#Solving the matrix ie, getting its inverse.
    return(inverse)#Storing the inverse of the matrix in variable inverse.
}


#Working.
#Run these codes to check.
mat<-makeCacheMatrix(matrix(1:4, 2, 2))
mat$get()
mat$getInverse()
mat$set(matrix(c(1,4,3,2),2,2))
mat$get()
mat$getInverse()