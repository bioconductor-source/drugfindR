% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/investigateSignature.R
\name{investigateSignature}
\alias{investigateSignature}
\title{Investigate a given DGE dataset
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}}
\usage{
investigateSignature(
  expr,
  outputLib,
  filterThreshold = NULL,
  filterProp = NULL,
  similarityThreshold = 0.2,
  paired = TRUE,
  outputCellLines = NULL,
  geneColumn = "Symbol",
  logfcColumn = "logFC",
  pvalColumn = "PValue",
  sourceName = "Input",
  sourceCellLine = "NA",
  sourceTime = "NA",
  sourceConcentration = "NA"
)
}
\arguments{
\item{expr}{A dataframe that has differential gene expression analysis}

\item{outputLib}{The library to search}

\item{filterThreshold}{The Filtering threshold.}

\item{filterProp}{The Filtering proportion.}

\item{similarityThreshold}{The Similarity Threshold}

\item{paired}{Logical. Whether to query iLINCS separately
for up and down regulated genes}

\item{outputCellLines}{A character vector of cell lines
to restrict the output search to.}

\item{geneColumn}{The name of the column that has gene symbols}

\item{logfcColumn}{The name of the column that has log_2 fold-change values}

\item{pvalColumn}{The name of the column that has p-values}

\item{sourceName}{(Optional) An annotation column to identify
the signature by name}

\item{sourceCellLine}{(Optional) An annotation column to specify
the cell line for the input data}

\item{sourceTime}{(Optional) An annotation column to specify the
time for the input data}

\item{sourceConcentration}{(Optional) An annotation column to specify
the concentration for the input data}
}
\value{
A tibble with the the similarity scores and signature metadata
}
\description{
This function takes a DGE Data frame and then
finds concordant signatures to that.
This generates an L1000 signature from the DGE
dataset and then uploads that signature to
iLINCS to find the relevant concordant (or discordant) signatures
}
\examples{

# Investigate a signature

# Load and prepare the signature
inputSignature <- read.table(system.file("extdata",
    "dCovid_diffexp.tsv",
    package = "drugfindR"
), header = TRUE)


# Investigate the signature

investigatedSignature <- investigateSignature(inputSignature,
    outputLib = "CP",
    filterThreshold = 0.5,
    geneColumn = "hgnc_symbol",
    logfcColumn = "logFC",
    pvalColumn = "PValue"
)
}
