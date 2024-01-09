### =========================================================================
### Make metadata
### -------------------------------------------------------------------------
###

# Parabiosis10X
parabiosis <- data.frame(
  Title = "Parabiosis10X",
  Description = "10X Genomics processed single-cell dataset from Ximerakis et al. 2023",
  BiocVersion = "3.18",
  Genome = "mm10",
  SourceType = "rds",
  SourceUrl = "",
  SourceVersion = NA,
  Species = "Mus musculus",
  TaxonomyId = 10090,
  Coordinate_1_based = NA,
  DataProvider = "Lee Rubin at Harvard Stem Cell Institute",
  Maintainer = "Tram Nguyen <Tram_Nguyen@hms.harvard.edu>",
  RDataClass = "SingleCellExperiment",
  DispatchClass = "Rds",
  RDataPath = "MouseAgingData/parabiosis_sce.RDS",
  stringsAsFactors = FALSE
)

# # caloric2020
# caloric2020 <- data.frame(
#   Title = "caloric2020",
#   Description = "Single-nucleus RNA data from Ma et al. 2020",
#   BiocVersion = "3.18",
#   Genome = "mRatBN7.2",
#   SourceType = "rds",
#   SourceUrl = "",
#   SourceVersion = NA,
#   Species = "Rattus norvegicus",
#   TaxonomyId = 10116,
#   Coordinate_1_based = NA,
#   DataProvider = "Lee Rubin at Harvard Stem Cell Institute",
#   Maintainer = "Tram Nguyen <Tram_Nguyen@hms.harvard.edu>",
#   RDataClass = "SingleCellExperiment",
#   DispatchClass = "Rds",
#   RDataPath = "MouseAgingData/caloric2020_sce.RDS",
#   stringsAsFactors = FALSE
# )

## Combined meta-data
df_all <- base::rbind(
   parabiosis
   )


## Save .csv file
write.csv(df_all, file = "inst/extdata/metadata.csv", row.names = FALSE)
