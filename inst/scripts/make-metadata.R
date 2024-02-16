### =========================================================================
### Make metadata
### -------------------------------------------------------------------------
###

# Parabiosis10X
Parabiosis10x <- data.frame(
    Title = "Parabiosis10X",
    Description = paste0("10X Genomics processed single-cell dataset ",
                         "from Ximerakis & Holton et al. 2023"),
    BiocVersion = "3.19",
    Genome = "mm10",
    SourceType = "RDS",
    SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE222510",
    SourceVersion = NA,
    Species = "Mus musculus",
    TaxonomyId = 10090,
    Coordinate_1_based = NA,
    DataProvider = "Lee Rubin at Harvard Stem Cell Institute",
    Maintainer = "Tram Nguyen <Tram_Nguyen@hms.harvard.edu>",
    RDataClass = "SingleCellExperiment",
    DispatchClass = "RDS",
    RDataPath = "MouseAgingData/parabiosis_sce.rds",
    stringsAsFactors = FALSE
)

# Combined meta-data
df_all <- base::rbind(
    Parabiosis10x
)

# Save .csv file
write.csv(df_all, file = "inst/extdata/metadata.csv", row.names = FALSE)
