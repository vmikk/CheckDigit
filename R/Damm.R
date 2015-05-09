# Damm algorithm decimal check digit
# http://en.wikipedia.org/wiki/Damm_algorithm

Damm <- function(x){

	# Damm, H. Michael (2004). Total anti-symmetrische Quasigruppen. see Page 111
	damm.matr <- matrix(
		data=c(0, 3, 1, 7, 5, 9, 8, 6, 4, 2,
			7, 0, 9, 2, 1, 5, 4, 8, 6, 3,
			4, 2, 0, 6, 8, 7, 1, 3, 5, 9,
			1, 7, 5, 0, 9, 8, 3, 4, 2, 6,
			6, 1, 2, 3, 0, 4, 5, 9, 7, 8,
			3, 6, 7, 4, 2, 0, 9, 5, 8, 1,
			5, 8, 6, 9, 7, 2, 0, 1, 3, 4,
			8, 9, 4, 5, 3, 6, 2, 0, 1, 7,
			9, 4, 3, 8, 6, 1, 7, 2, 0, 5,
			2, 5, 8, 1, 4, 3, 6, 7, 9, 0),
		ncol=10, nrow=10, byrow = T)
	
	rownames(damm.matr) <- colnames(damm.matr) <- c(1:10)-1
 
	y <- gsub('\\D', '', x)
	y <- as.integer(unlist(strsplit(y, '')))

	interim <- 0
	
	for(i in y){
		interim <- damm.matr[which(rownames(damm.matr) == interim), which(colnames(damm.matr) == i)]
	}
	
	return(interim)
}


AppendCheckDigit.Damm <- function(x){
	x[is.na(x)] <- NA

	if(any(grepl('\\D', x))){
		warning('Non-digit characters are disregarded in check digit calculation')
	}

	y <- sapply(x, function(x){
					if (x %in% c('', NA, NaN)) {
						return(x)
					} else {
						return( paste(x, Damm(x), sep='') )
					}
		})
	return(y)
}


VerifyCheckDigit.Damm <- function(x){
	x[is.na(x)] <- NA

	if (any(grepl('\\D', x))){
		warning('Non-digit characters are disregarded in check digit calculation')
	}

	y <- sapply(x, function(x){
					if (x %in% c('', NA, NaN)) {
						return(FALSE)
					} else {
						return( Damm(x) == 0 )
					}
		})
	return(y)
}



## Check results
	# Damm(572) == 4
	# AppendCheckDigit.Damm(572)
	# VerifyCheckDigit.Damm(5724)


	# Damm(43881234567) == 9
	# AppendCheckDigit.Damm(43881234567)
	# VerifyCheckDigit.Damm(438812345679)
