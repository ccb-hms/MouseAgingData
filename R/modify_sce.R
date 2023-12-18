sce <- readRDS("../parabiosis_sce.rds")

colnames(sce) <- NULL # Remove barcodes in the colnames
colData(sce)$orig.ident <- NULL
colData(sce)$sample_order <- NULL

# Change column names of metdata
names(colData(sce))[which(names(colData(sce)) =="animal_name")] <- "parabiosis_category"
names(colData(sce))[which(names(colData(sce)) =="percent.mito")] <- "percent_mito"
names(colData(sce))[which(names(colData(sce)) =="percent.ribo")] <- "percent_ribo"
names(colData(sce))[which(names(colData(sce)) =="percent.ribo")] <- "percent_ribo"

counts(sce)
rowData(sce) <- NULL # Remove gene ID from rowData

# remove current metadata and add cell colors from Kris
metadata(sce)$Samples <- NULL
metadata(sce)$cell_colors <- color.map.list_All_Lin
sce

saveRDS(sce, "../parabiosis_sce.rds")
