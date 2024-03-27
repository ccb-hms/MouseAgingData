### =========================================================================
### Make metadata
### -------------------------------------------------------------------------
###

# Parabiosis10x
Parabiosis10x <- data.frame(
    Title = "Parabiosis10x",
    Description = paste0("10x Genomics processed single-cell dataset ",
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

# AgingBrain10x_2019NN
AgingBrain10x_2019NN <- data.frame(
    Title = "AgingBrain10x_2019NN",
    Description = paste0("10x Genomics processed single-cell dataset ",
                         "from Ximerakis et al. 2019"),
    BiocVersion = "3.19",
    Genome = "mm10",
    SourceType = "RDS",
    SourceUrl = "https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE129788",
    SourceVersion = NA,
    Species = "Mus musculus",
    TaxonomyId = 10090,
    Coordinate_1_based = NA,
    DataProvider = "Lee Rubin at Harvard Stem Cell Institute",
    Maintainer = "Tram Nguyen <Tram_Nguyen@hms.harvard.edu>",
    RDataClass = "SingleCellExperiment",
    DispatchClass = "RDS",
    RDataPath = "MouseAgingData/brain10x_2019NN.rds",
    stringsAsFactors = FALSE
)

# Combined meta-data
df_all <- base::rbind(
    Parabiosis10x, 
    AgingBrain10x_2019NN
)

# Save .csv file
write.csv(df_all, file = "inst/extdata/metadata.csv", row.names = FALSE)
