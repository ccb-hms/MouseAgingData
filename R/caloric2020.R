#' Access the caloric 2019 single-cell RNA-seq data
#'
#' Access the raw (10x Genomics) RNA-seq data from the caloric restriction study
#' by Ma et al. 2020
#'
#' The data set was downloaded from GEO assession number GSE137869
#' (https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE137869).
#'
#' @return If \code{infoOnly} is \code{FALSE}, returns a named list of
#'   \linkS4class{SingleCellExperiment} objects (one per tissue requested
#'   via \code{tissues}). Otherwise, each element in the list is `NULL`.
#'
#' @param tissues A character vector with the tissues to retrieve objects for.
#'   A list of available tissues can be obtained using
#'   \code{listTabulaMurisSenisTissues("Droplet")}.
#' @param processedCounts Logical scalar. If \code{TRUE}, include the processed
#'   counts in addition to the raw counts in the SingleCellExperiment object.
#' @param reducedDims Logical scalar. If \code{TRUE}, include the PCA, tSNE
#'   and UMAP representations in the SingleCellExperiment object (the tSNE
#'   representation is not available for the full dataset ('All' tissue)).
#' @param infoOnly Logical scalar. If \code{TRUE}, only print the total size
#'   of the files that will be downloaded to and/or retrieved from the cache.
#'
#' @author Charlotte Soneson
#'
#' @references
#' Schaum et al (2019): The murine transcriptome reveals global aging nodes with
#' organ-specific phase and amplitude. bioRxiv doi:10.1101/662254.
#'
#' The Tabula Muris Consortium (2020): A single-cell transcriptomic atlas
#' characterizes ageing tissues in the mouse. Nature 583:590–595.
#'
#' @examples
#' if (interactive()) {
#'   sce <- TabulaMurisSenisDroplet(tissues = "All")
#' }
#'
#' @export
#'
#' @importFrom ExperimentHub ExperimentHub
#'
caloric2020 <- function(tissues = "All", processedCounts = FALSE,
                                    reducedDims = TRUE, infoOnly = FALSE) {
  allowedTissues <- listTabulaMurisSenisTissues(dataset = "Droplet")
  if (!all(tissues %in% allowedTissues)) {
    stop("'tissues' must be a subset of ",
         paste(allowedTissues, collapse = ", "))
  }

  hub <- ExperimentHub::ExperimentHub()
  host <- file.path("TabulaMurisSenisData", "tabula-muris-senis-droplet")

  names(tissues) <- tissues
  .tmsSingleCell(hub = hub, host = host, tissues = tissues,
                 processedCounts = processedCounts,
                 reducedDims = reducedDims, infoOnly = infoOnly)
}
