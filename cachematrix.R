## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#create a  new enviroenment to allow functions to maintain state (cache) across function calls
matrix_env <- new.env(parent = emptyenv()) 
matrix_env$inverse_flag <- FALSE		# initialize environment flag for inverse

makeCacheMatrix <- function(x = matrix()) {
	matrix_env$matrix1 <- x				# assign variable matrix1 to passed matrix argument
	  
	if (!matrix_env$inverse_flag ) {	# if inverse flag is false generate inverse else use cache
		cacheSolve(matrix_env$matrix1)
	}else {
		print("using cached version")
		return(matrix_env$inverse1)		# return cached inverse
		}
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		#
		
		matrix_env$inverse1 <- solve(x) # generate inverse matrix
		matrix_env$inverse_flag <- TRUE # set inverse flag to TRUE
		return(matrix_env$inverse1)		# return inverse matrix
}

mat1 <- matrix(c(1, 2, 3, 4), ncol =2)  # create a test matrix
inverse_mat1 <- makeCacheMatrix(mat1)	# call make cache once - generate inverse
inverse_mat1 <- makeCacheMatrix(mat1)	# call make cahe second time use cache
