# MouseAgingData

## Mouse aging multi-omics project data from Lee Rubin Lab at Harvard Medical School

This package includes analysis-ready data resource of different 
aging omics datasets, including the aging mouse brain single cell study 
(Ximerakis et al., 2019), aging mouse brain parabiosis single cell study 
(Ximerakis et al., 2023). In addition, two relevant transcriptomic studies of 
rejuvenation in the GEO database are also available, including: an aging mouse 
caloric restriction single cell study (GSE137869, Ma et al., 2020), and an 
aging mouse exercise single cell study (GSE196364, Liu et al., 2022). 

<br>


## Installation

Install the package from Bioconductor or GitHub, ensuring correct
*Bioconductor* dependencies.

When the package is available on *Bioconductor*, use

``` r
if (!"BiocManager" %in% rownames(installed.packages()))
    install.packages("BiocManager", repos = "https://cloud.R-project.org")
if (BiocManager::version() >= "3.19") {
    BiocManager::install("AlphaMissenseR")
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

#### 1. Ximerakis et al. 2023 Parabiosis 10X Genomics Single-Cell Data

This package contains the processed 10X Genomics data from Ximerakis et al. ([2023](https://www.nature.com/articles/s43587-023-00373-6)) prepared based on 
the protocol detailed in their paper. The processed dataset contains 
105,329 cells and 20905 features for 31 cell types. Low quality cells and 
animals were removed following Ximerakis et al. (2023) resulting in 8 OX, 8 YX, 
7 YY, 9 YO, 7 OO, 11 OY animals.

We also provide the raw single-cell data outputted from CellRanger 
for users to explore and assign their own filering thresholds for quality. The 
raw dataset contains 158,767 cells with data for 21,876 features outputted from 
CellRanger for a total of 55 animals.

This package includes gene counts, cell annotation, and reduced-dimension 
representations as separate components of the processed data, and also as a 
stored `SingleCellExperiment` object.

Finally, a reminder of the heterochronic groups included in this study is available below:
Aging OX v YX; RJV: OY v OX; AGA YO v YX

<br>


#### References

Ximerakis, M., Holton, K.M., Giadone, R.M. et al. Heterochronic parabiosis 
reprograms the mouse brain transcriptome by shifting aging signatures in 
multiple cell types. *Nat Aging* __3__, 327–345 (2023). 
[https://doi.org/10.1038/s43587-023-00373-6](https://doi.org/10.1038/s43587-023-00373-6)


