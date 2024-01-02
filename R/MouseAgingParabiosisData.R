#' Load mouse aging parabiosis data
#'
#' Obtain the processed or raw counts for the mouse again parabiosis 10X Genomics scRNA dataset.
#'
#' @param type String specifying the type of data to obtain, see Details.
#' Default behaviour is to return processed data.
#' @param samples Integer or character vector specifying the samples for which data (processed or raw) should be obtained.
#' If \code{NULL} (default), data are returned for all (36) samples.
#' @param get.spliced Logical indicating whether to also download the spliced/unspliced/ambiguously spliced count matrices.
#'
#' @return
#' If \code{type="processed"}, a \linkS4class{SingleCellExperiment} is returned containing processed data from selected samples.
#'
#' If \code{type="raw"}, a \linkS4class{List} of SingleCellExperiments is returned,
#' each containing the raw counts for a single sample.
#' List elements are named after the corresponding sample.
#'
#' @details
#' This function downloads the data for the mouse aging parabiosis study from Ximerakis et al ([2023](https://www.nature.com/articles/s43587-023-00373-6)).
#'
#' The processed dataset contains 105,329 cells and 20905 features for 31 cell types. Low quality cells and animals were removed following Ximerakis et al. (2023) resulting in 8 OX, 8 YX, 7 YY, 9 YO, 7 OO, 11 OY animals.
#' The row metadata contains MGI symbol for each gene.
#'
#'
#'
#' A reminder of the heterochronic groups included in this study is available below:
#' Aging OX v YX; RJV: OY v OX; AGA YO v YX
#'
#'
#' # Metadata -----------------------------------------------------------------------------
#'
#' The \code{parabiosis_metadata} variable contains information about each of these samples.
#'
#'
#' The column metadata for called cells contains:
#' \describe{
#' \item{\code{cell}:}{Character, unique cell identifier across all samples.}
#' \item{\code{orig.ident}:}{Character, origin project identifier.}
#' \item{\code{nCount_RNA}:}{Numeric, number of RNA transcripts.}
#' \item{\code{nFeature_RNA}:}{Integer, number of RNA features.}
#' \item{\code{sample_order}:}{Character, unique animal identifier and sequencing batch.}
#' \item{\code{animal}:}{Character, unique animal identifier, includes heterochronic or isochronic condition.}
#' \item{\code{batch}:}{Character, sequencing batch identifier.}
#' \item{\code{animal_name}:}{Character, isochronic or heterochronic conditions.}
#' \item{\code{percent.mito}:}{Numeric, percentage of mitochondrial content.}
#' \item{\code{percent.ribo}:}{Numeric, percentage of ribosomal content.}
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
MouseAgingParabiosisData <- function(type=c("processed", "raw"), samples=NULL, get.spliced=FALSE) {
  type <- match.arg(type)
  versions <- list(base="1.0.0")
  extra_a <- NULL
  if(get.spliced){
    if(type=="raw"){
      stop("Cannot get spliced counts with the raw data")
    }
    extra_a <- list(
      spliced_counts="counts-spliced",
      unspliced_counts="counts-unspliced",
      ambiguous_counts="counts-ambig")
    versions <- c(versions, list(
      "counts-spliced"="1.4.0",
      "counts-unspliced"="1.4.0",
      "counts-ambig"="1.4.0"))
  }
  .getRNAseqData("atlas", type, versions, samples, sample.options=as.character(c(1:10, 12:37)), sample.err="1:10 or 12:37", extra_assays = extra_a)
}
