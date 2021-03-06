.calcLikelihoodQuantitiesPCG <- function(Y, X, Sigma, Sigma.inv_X){

    # if (is(Sigma.inv, "Matrix")) X <- Matrix(X)
    # X <- matrix(X)
    # Y <- matrix(Y)
    n <- length(Y)
    k <- ncol(X)
    
    ### Calulate the weighted least squares estimate
    # Sigma.inv_X <- crossprod(Sigma.inv, X)
###    chol.Xt_Sigma.inv_X <- chol(crossprod(X, Sigma.inv_X))
    
    tempXXX <- crossprod(X, Sigma.inv_X)
    tempXXX <- (tempXXX + t(tempXXX))/2
    chol.Xt_Sigma.inv_X <- chol(tempXXX)
    Xt_Sigma.inv_X.inv <- chol2inv(chol.Xt_Sigma.inv_X)
    beta <- crossprod(Xt_Sigma.inv_X.inv, crossprod(Sigma.inv_X, Y))
    
    ## calculate the mean of the outcomes
    fits <- tcrossprod(X, t(beta))
    
    # obtain marginal residuals
    residM <- as.vector(Y - fits)
    # Sigma.inv_R <- crossprod(Sigma.inv, residM)
    Sigma.inv_R <- .pcg(Sigma,residM)
    
    # calculate likelihood quantities
    Rt_Sigma.inv_R <- crossprod(residM, Sigma.inv_R)
    RSS <- as.numeric(Rt_Sigma.inv_R/(n - k)) 
    # logLik <- as.numeric(-0.5 * n * log(2 * pi * RSS) - sum(log( cholSigma.diag)) -
    #                      0.5 * Rt_Sigma.inv_R/RSS)
    logLik <- NULL
    ## log likelihood- REML type, accounting for estimation of mean effects.    
    # logLikR <- as.numeric(logLik + 0.5 * k * log(2 * pi * RSS) - sum(log(diag(chol.Xt_Sigma.inv_X))))
    logLikR <- NULL
    ## calculate projection matrix.
###    P <- Sigma.inv - tcrossprod(tcrossprod(Sigma.inv_X, Xt_Sigma.inv_X.inv), Sigma.inv_X)
###    PY <- crossprod(P, Y)
###    PY <- Sigma.inv %*% Y - tcrossprod(tcrossprod(Sigma.inv_X, Xt_Sigma.inv_X.inv), t(Y) %*% Sigma.inv_X)	  
    # PY <- crossprod(Sigma.inv, Y) - crossprod(tcrossprod(Xt_Sigma.inv_X.inv, Sigma.inv_X), crossprod(Sigma.inv_X, Y))
    PY <- .LeftMP(Y,X, Sigma, Sigma.inv_X)
    
    return(list(PY = PY, RSS = RSS, logLik = logLik, logLikR = logLikR, 
                Sigma.inv_X = Sigma.inv_X, Xt_Sigma.inv_X.inv = Xt_Sigma.inv_X.inv, 
                beta = as.numeric(beta), fits = fits, residM = residM))
    
}
