\name{NEWS}
\title{NEWS for GENESIS}
\section{Version 2.15.3}{
    \itemize{
      \item Add option "fastSKAT" to assocTestAggregate. Some other arguments and names of output columns for SKAT tests have also changed. This update includes code from the bigQF package (https://github.com/tslumley/bigQF). With the addition of C code, GENESIS now requires compliation.
    }
}
\section{Version 2.13.7}{
    \itemize{
        \item Remove all monomorphic variants (including all heterozygotes) from association test results.
    }
}
\section{Version 2.13.3}{
    \itemize{
        \item Restore option to run pcair without kinship matrix.
    }
}
\section{Version 2.13.2}{
    \itemize{
        \item Add option to use imputed dosage in association tests.
    }
}
\section{Version 2.12.0}{
    \itemize{
      \item pcair and pcrelate have been completely rewritten for better consistency with other methods. Some argument names have changed; see the documentation. The output of pcrelate is now a list of data.frames instead of a list of matrices.
      \item pcrelateReadKinship and pcrelateReadInbreed are deprecated, as these tables are now returned by pcrelate.
      \item pcrelateMakeGRM is deprecated; use pcrelateToMatrix with new pcrelate output format.
      \item king2mat is deprecated; use kingToMatrix instead.
      \item fitNullMM, fitNullReg, assocTestMM, and admixMapMM are deprecated. assocTestSeq and assocTestSeqWindow are defunct. Use fitNullModel, assocTestSingle, assocTestAggregate, and admixMap instead.
    }
}
\section{Version 2.11.15}{
    \itemize{
        \item Refactor pcrelate.
    }
}
\section{Version 2.11.14}{
    \itemize{
        \item Added assocTestAggregate method for GenotypeData objects.
    }
}
\section{Version 2.11.11}{
    \itemize{
        \item Refactor pcair.
    }
}
\section{Version 2.11.8}{
    \itemize{
        \item Added admixMap function to replace admixMapMM.
    }
}
\section{Version 2.11.4}{
    \itemize{
        \item Added assocTestSingle and fitNullModel methods for GenotypeData objects.
    }
}
\section{Version 2.9.3}{
    \itemize{
	\item New methods assocTestSingle and assocTestAggregate are refactors of assocTestMM and assocTestSeq/assocTestSeqWindow, respectively. assocTestSeq and assocTestSeqWindow are deprecated. assocTestMM is still used for GenotypeData objects, but will be deprecated in a future release. fitNullModel is a refactor of fitNullMM/fitNullReg and should be used with the new association test methods.
    }
}
\section{Version 2.7.4}{
    \itemize{
	\item In fitNullMM, for Binomial and Poisson GLM families, the variance of the fixed effects will not be multiplied by the dispersion parameter RSS.
    }
}
\section{Version 2.7.3}{
    \itemize{
	\item Change defaults in assocTestSeq*: Davies method for SKAT p-values, flat weights.
    }
}
\section{Version 2.6.0}{
    \itemize{
	\item Major bug fix: assocTestSeq no longer drops some variants from aggregate tests in the case where the same variants are included in more than one aggregate unit.
        \item Added function for analysis of admixture mapping data.
    }
}
\section{Version 2.2.0}{
    \itemize{
	\item Added support for sequence data files created with the SeqArray package.
        \item Added functions for Burden and SKAT tests of sequence data.
    }
}
\section{Version 2.0.0}{
    \itemize{
        \item Added functions for PC-Relate.  PC-Relate provides model-free estimation of recent genetic relatedness in general samples.  It can be used to estimate kinship coefficients, IBD sharing probabilities, and inbreeding coefficients using genome-wide SNP data.  PC-Relate accounts for population structure (ancestry) among sample individuals through the use of ancestry representative principal components (PCs) to provide accurate relatedness estimates due only to recent family (pedigree) structure.
        \item GENESIS now imports the package gdsfmt.
    }
}
\section{Version 1.1.1}{
	\itemize{
		\item Changed a few default values:  MAF filter from 0.05 to 0.01; kin.thresh from 0.025 to 2^(-11/2) ~ 0.022; div.thresh from -0.025 to -2^(-11/2) ~ -0.022; v (the number of PCs returned) from 10 to 20
		\item Changed the argument 'block.size' to 'snp.block.size'
		\item Slightly altered the command line reporting when verbose = TRUE
	}
}
\section{Version 0.99.4}{
    \itemize{
        \item Fixed a minor bug to zero out diagonal of divMat in pcairPartition()
    }
}
\section{Version 0.99.0}{
    \itemize{
        \item Initial version of GENESIS.  Contains functionality to perform PC-AiR.
    }
}
