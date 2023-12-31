% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fast_mnn.R
\name{RunFastMNN}
\alias{RunFastMNN}
\title{Run fastMNN}
\usage{
RunFastMNN(
  object.list,
  assay = NULL,
  features = 2000,
  reduction.name = "mnn",
  reduction.key = "mnn_",
  reconstructed.assay = "mnn.reconstructed",
  verbose = TRUE,
  ...
)
}
\arguments{
\item{object.list}{A list of Seurat objects}

\item{assay}{Assay to use, defaults to the default assay of the first object}

\item{features}{Either a list of features to use when calculating batch
correction, or a number (2000 by default) of variable features to select.}

\item{reduction.name}{Name to store resulting DimReduc object as}

\item{reduction.key}{Key for resulting DimReduc}

\item{reconstructed.assay}{Name for the assay containing the low-rank
reconstruction of the expression matrix.}

\item{verbose}{Print messages from \code{\link[Seurat]{SelectIntegrationFeatures}}}

\item{...}{Extra parameters passed to \code{\link[batchelor]{fastMNN}}}
}
\value{
A Seurat object merged from the objects in \code{object.list} and a
new DimReduc of name \code{reduction.name} (key set to \code{reduction.key})
with corrected embeddings matrix as well as the rotation matrix used for the
PCA stored in the feature loadings slot. Also returns an expression matrix
reconstructed from the low-rank approximation in the
\code{reconstructed.assay} assay; all other metadata info
\code{\link[batchelor]{fastMNN}} is stored in the \code{tool} slot,
accessible with \code{\link[Seurat]{Tool}}
}
\description{
Run fastMNN
}
\seealso{
\code{\link[batchelor]{fastMNN}} \code{\link[Seurat]{Tool}}
}
