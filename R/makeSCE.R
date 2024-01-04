makeSCE <- function(matrix, genes, barcodes, tissue) {

  c.sce <- SingleCellExperiment(
    assays = list(counts = matrix),
    colData = DataFrame(tissue_type = rep(paste0(tissue), ncol(matrix)))
  )

  rowData(c.sce)$gene_names <- genes

  return(c.sce)
}



