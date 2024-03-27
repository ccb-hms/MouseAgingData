#' Load mouse 2019 Nature Neuroscience aging brain data
#'
#' Obtain the processed data set for the mouse aging brain 10x Genomics
#' RNA-seq dataset from Ximerakis et al. 2019. 
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
#' This function downloads the data for the mouse aging brain study from
#' Ximerakis et al.
#' ([2019](https://www.nature.com/articles/s41593-019-0491-3)).
#'
#' The processed dataset contains 37,089 cells and 14,699 features for 25
#' cell types. Low quality cells and animals were removed following
#' Ximerakis et al. (2019) resulting in data for 8 young and 8 old mice.
#' The row metadata contains MGI symbol for each gene.
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
#' \item{\code{animal}:}{Factor, unique animal identifier.}
#' \item{\code{batch}:}{Factor, batch identifier.}
#' \item{\code{animal_type}:}{Factor, young (YX) or old (OX) conditions of
#'                      the animal.}
#' \item{\code{percent_mito}:}{Numeric, percentage of mitochondrial content.}
#' \item{\code{percent_ribo}:}{Numeric, percentage of ribosomal content.}
#' \item{\code{cell_type}:}{Factor, cell type to which the cell was assigned.}
#' \item{\code{cell_ontology_class}:}{Factor, Cell Ontology label.}
#' \item{\code{cell_ontology_id}:}{Factor, Cell Ontology identifier}
#'}
#'
#'
#' @author Tram Nguyen
#'
#' @references
#' Ximerakis et al. (2019)
#' Single-cell transcriptomic profiling of the aging mouse brain. 
#' \emph{Nat Neurosci} 22, 1696–1708. DOI:https://doi.org/10.1038/s41593-019-0491-3.
#'
#' @examples
#' data <- AgingBrain10x()
#' data_meta <- AgingBrain10x(metadata = TRUE)
#'
#' @export
#' @importFrom SingleCellExperiment SingleCellExperiment
AgingBrain10x <- function (metadata = FALSE)
{
    eh <- ExperimentHub::ExperimentHub()
    title <- "AgingBrain10x_2019NN"
    
    eh <- AnnotationHub::query(eh, title)
    ehid <- eh$ah_id
    
    if (metadata == TRUE) {
        eh[ehid]
    }
    else eh[[ehid]]
}