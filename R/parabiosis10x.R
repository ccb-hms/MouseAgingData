#' Load mouse aging parabiosis data
#'
#' Obtain the processed data set for the mouse aging parabiosis 10x Genomics
#' RNA-seq dataset from Ximerakis & Holton et al. 2023.
#'
#' @param metadata Logical, whether only experiment metadata should be returned.
#' Default behavior is to return processed data with metadata included.
#'
#' @format SingleCellExperiment
#'
#' @return
#' Returns a [SingleCellExperiment()] object.
#'
#' @details
#' This function downloads the data for the mouse aging parabiosis study from
#' Ximerakis & Holton et al
#' ([2023](https://www.nature.com/articles/s43587-023-00373-6)).
#'
#' The processed dataset contains 105,329 cells and 20905 features for 31
#' cell types. Low quality cells and animals were removed following
#' Ximerakis & Holton et al. (2023) resulting in 8 OX, 8 YX, 7 YY, 9 YO, 7 OO,
#' 11 OY animals.
#' The row metadata contains MGI symbol for each gene.
#'
#'
#'
#' # Metadata
#'
#' The `colData` slot contains information about the cells and samples.
#'
#' The column metadata for called cells contains:
#' \describe{
#' \item{\code{barcode}:}{Character, unique cell identifier.}
#' \item{\code{nCount_RNA}:}{Numeric, number of RNA transcripts.}
#' \item{\code{nFeature_RNA}:}{Integer, number of RNA features.}
#' \item{\code{animal}:}{Factor, unique animal identifier, includes
#'                      heterochronic or isochronic condition.}
#' \item{\code{batch}:}{Factor, sequencing batch identifier.}
#' \item{\code{animal_type}:}{Factor, isochronic or heterochronic conditions of
#'                      the animal.}
#' \item{\code{percent_mito}:}{Numeric, percentage of mitochondrial content.}
#' \item{\code{percent_ribo}:}{Numeric, percentage of ribosomal content.}
#' \item{\code{cell_type}:}{Factor, cell type to which the cell was assigned.}
#' \item{\code{subpopulation}:}{Factor, cell subpopulation.}
#' \item{\code{cell_ontology_class}:}{Factor, Cell Ontology label.}
#' \item{\code{cell_ontology_id}:}{Factor, Cell Ontology identifier}
#'}
#'
#'
#' @author Tram Nguyen
#'
#' @references
#' Ximerakis & Holton et al. (2023)
#' Heterochronic parabiosis reprograms the mouse brain transcriptome by shifting
#' aging signatures in multiple cell types.
#' \emph{Nat Aging} 3, 327–345. DOI:https://doi.org/10.1038/s43587-023-00373-6.
#'
#' @examples
#' data <- parabiosis10x()
#' data_meta <- parabiosis10x(metadata = TRUE)
#'
#' @export
#' @importFrom SingleCellExperiment SingleCellExperiment
parabiosis10x <- function (metadata = FALSE)
{
    eh <- ExperimentHub::ExperimentHub()
    title <- "Parabiosis10x"
    
    eh <- AnnotationHub::query(eh, title)
    ehid <- eh$ah_id
    
    if (metadata == TRUE) {
        eh[ehid]
    }
    else eh[[ehid]]
}