### =========================================================================
### Make metadata
### -------------------------------------------------------------------------
###

# Parabiosis
parabiosis <- data.frame(
  Title = "ParabiosisDroplet",
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

# Dataset 2
df_smartseq2 <- data.frame(
  Title = "TabulaMurisSmartSeq2",
  Description = "SmartSeq2 data from Tabula Muris consortium",
  BiocVersion = "3.8",
  Genome = "mm10plus",
  SourceType = "rds",
  SourceUrl = "https://s3.amazonaws.com/czbiohub-tabula-muris/TM_facs_mat.rds",
  SourceVersion = NA,
  Species = "Mus musculus",
  TaxonomyId = "10090",
  Coordinate_1_based = NA,
  DataProvider = "Tabula Muris Consortium",
  Maintainer = "Charlotte Soneson <charlottesoneson@gmail.com>",
  RDataClass = "SingleCellExperiment",
  DispatchClass = "Rds",
  RDataPath = "TabulaMurisData/TabulaMurisSmartSeq2.rds",
  stringsAsFactors = FALSE
)

## Combined meta-data
df_all <- base::rbind(
  parabiosis,
  df_smartseq2
)

## Save .csv file
write.csv(df_all, file = "inst/extdata/metadata_parabiosis.csv", row.names = FALSE)
