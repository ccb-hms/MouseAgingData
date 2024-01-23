# MouseAgingData

## Data resources across several mouse aging studies

This MouseAgingData package provides analysis-ready data resources from different studies focused on aging and rejuvenation in mice. Studies include a 10X Genomics single-cell data sets from an aging mouse brain parabiosis transcriptomic study containing 105329 cells and 20905 features (Ximerakis & Holton et al., 2023). The data is provided as a SingleCellExperiment R object and includes a table of raw counts and cell metadata.
    
<br>


## Installation

Install the package from Bioconductor or GitHub, ensuring correct
*Bioconductor* dependencies.

When the package is available on *Bioconductor*, use

``` r
if (!"BiocManager" %in% rownames(installed.packages()))
    install.packages("BiocManager", repos = "https://cloud.R-project.org")
if (BiocManager::version() >= "3.19") {
    BiocManager::install("MouseAgingData")
} else {
    stop(
        "'MouseAgingData' requires Bioconductor version 3.19 or later, ",
        "install from GitHub?"
    )
}
```

Use the pre-release or development version with

``` r
if (!"remotes" %in% rownames(installed.packages()))
    install.packages("remotes", repos = "https://cloud.R-project.org")
remotes::install_github(
    "hms-ccb/MouseAgingData",
    repos = BiocManager::repositories()
)
```

Load the library.

``` r
library(MouseAgingData)
```

## Datasets

#### 1. Ximerakis & Holton et al. 2023 Parabiosis 10X Genomics Single-Cell Data

This package contains the processed 10X Genomics data from Ximerakis & Holton et al. ([2023](https://www.nature.com/articles/s43587-023-00373-6)) prepared based on the protocol detailed in their paper. The processed dataset contains 
105,329 cells and 20905 features for 31 cell types. Low quality cells and 
animals were removed following the paper's methods resulting in 8 OX, 8 YX, 
7 YY, 9 YO, 7 OO, 11 OY animals.

This package includes gene counts, cell annotation, and reduced-dimension 
representations as separate components of the processed data, and also as a 
stored `SingleCellExperiment` object.

<br>


#### References

Ximerakis, M., Holton, K.M., Giadone, R.M. et al. Heterochronic parabiosis 
reprograms the mouse brain transcriptome by shifting aging signatures in 
multiple cell types. *Nat Aging* __3__, 327–345 (2023). 
[https://doi.org/10.1038/s43587-023-00373-6](https://doi.org/10.1038/s43587-023-00373-6)


