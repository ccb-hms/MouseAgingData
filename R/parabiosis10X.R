#' Load mouse aging parabiosis data
#'
#' Obtain the processed data set for the mouse aging parabiosis 10X Genomics scRNA dataset from Ximerakis et al. 2023.
#'
#' @param metadata Logical, whether only metadata should be returned
#' Default behavior is to return processed data with metadata included.
#'
#' @format SingleCellExperiment
#'
#' @return
#' Returns a SingleCellExperiment object.
#'
#' @details
#' This function downloads the data for the mouse aging parabiosis study from Ximerakis et al ([2023](https://www.nature.com/articles/s43587-023-00373-6)).
#'
#' The processed dataset contains 105,329 cells and 20905 features for 31 cell types. Low quality cells and animals were removed following Ximerakis et al. (2023) resulting in 8 OX, 8 YX, 7 YY, 9 YO, 7 OO, 11 OY animals.
#' The row metadata contains MGI symbol for each gene.
#'
#'
#' A reminder of the heterochronic groups included in this study is available below:
#' Aging OX v YX; RJV: OY v OX; AGA YO v YX
#'
#'
#' # Metadata ---------------------------------------------------------------
#'
#' The \code{parabiosis_metadata} variable contains information about each of these samples.
#'
#' The column metadata for called cells contains:
#' \describe{
#' \item{\code{barcode}:}{Character, unique cell identifier.}
#' \item{\code{nCount_RNA}:}{Numeric, number of RNA transcripts.}
#' \item{\code{nFeature_RNA}:}{Integer, number of RNA features.}
#' \item{\code{animal}:}{Character, unique animal identifier, includes heterochronic or isochronic condition.}
#' \item{\code{batch}:}{Character, sequencing batch identifier.}
#' \item{\code{parabiosis_category}:}{Character, isochronic or heterochronic conditions.}
#' \item{\code{percent_mito}:}{Numeric, percentage of mitochondrial content.}
#' \item{\code{percent_ribo}:}{Numeric, percentage of ribosomal content.}
#' \item{\code{cell_type}:}{Character, cell type to which the cell was assigned.}
#' \item{\code{subpopulation}:}{Character, cell subpopulation to which cell was assigned.}
#'}
#'
#'
#' @author Tram Nguyen
#'
#' @references
#' Ximerakis et al. (2023)
#' Heterochronic parabiosis reprograms the mouse brain transcriptome by shifting aging signatures in multiple cell types.
#' \emph{Nat Aging} 3, 327–345. DOI:https://doi.org/10.1038/s43587-023-00373-6.
#'
#' @export
#' @importFrom ExperimentHub ExperimentHub
#' @importFrom SingleCellExperiment SingleCellExperiment
#' @importFrom BiocGenerics sizeFactors
#' @importClassesFrom S4Vectors DataFrame
#' @importFrom methods as
parabiosis10X <- function (metadata = FALSE)
{
  hub <- ExperimentHub::ExperimentHub()
  title <- "Parabiosis10X"

  eh <- .get_ExperimentHub(hub, title)
  ehid <- eh$ah_id

  if (metadata) {
    eh[ehid]
  }
  else eh[[ehid]]
}
