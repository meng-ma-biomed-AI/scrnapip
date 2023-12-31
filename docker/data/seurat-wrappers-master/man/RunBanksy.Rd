% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/banksy.R
\name{RunBanksy}
\alias{RunBanksy}
\title{Run Banksy on a Seurat Object}
\usage{
RunBanksy(
  object,
  lambda,
  assay = "RNA",
  slot = "data",
  dimx = NULL,
  dimy = NULL,
  features = "variable",
  k_geom = 10,
  n = 2,
  sigma = 1.5,
  alpha = 0.05,
  k_spatial = 10,
  spatial_mode = "kNN_r",
  assay_name = "BANKSY",
  verbose = TRUE
)
}
\arguments{
\item{object}{A Seurat object}

\item{lambda}{(numeric) Spatial weight parameter}

\item{assay}{(character) Assay in Seurat object to use}

\item{slot}{(character) Slot in Seurat assay to use}

\item{dimx}{(character) Column name of spatial x dimension (must be in metadata)}

\item{dimy}{(character) Column name of spatial y dimension (must be in metadata)}

\item{features}{(character) Features to compute. Can be 'all', 'variable' or
a vector of feature names}

\item{k_geom}{(numeric) kNN parameter - number of neighbors to use}

\item{n}{(numeric) kNN_rn parameter - exponent of radius}

\item{sigma}{(numeric) rNN parameter - standard deviation of Gaussian kernel}

\item{alpha}{(numeric) rNN parameter - determines radius used}

\item{k_spatial}{(numeric) rNN parameter - number of neighbors to use}

\item{spatial_mode}{(character) spatial mode to use (kNN_r, kNN_rn, kNN_rank,
kNN_unif, rNN_gauss)}

\item{assay_name}{(character) Name for Banksy assay in Seurat object}

\item{verbose}{(boolean) Print messages}
}
\value{
A Seurat object with new assay holding a Banksy matrix
}
\description{
Run Banksy on a Seurat Object
}
\references{
Vipul Singhal, Nigel Chou et. al. BANKSY: A Spatial Omics
Algorithm that Unifies Cell Type Clustering and Tissue Domain Segmentation
}
\seealso{
\code{\link[Banksy]{ComputeBanksy}}
}
\author{
Joseph Lee, Vipul Singhal
}
