# MouseAgingData

## Data resources across several mouse aging studies

The MouseAgingData package provides analysis-ready data resources from different single-cell studies focused on aging and rejuvenation in mice. Currently, the package includes two 10x Genomics single-cell RNA-seq data sets. The first includes data from a transcriptome study profiling 8 young and 8 old mouse brains ([Ximerakis et al., 2019](https://www.nature.com/articles/s41593-019-0491-3])), measuring 14,699 features across 37,089 cells. The second includes data from a parabiosis aging mouse brain study measuring 20,905 gene features across 105,329 cells ([Ximerakis & Holton et al., 2023](https://doi.org/10.1038/s43587-023-00373-6])). The data are provided as [SingleCellExperiment](https://bioconductor.org/packages/SingleCellExperiment) R objects and includes tables of raw UMI counts and cell metadata.
    
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

#### 1. Ximerakis et al. 2019 Aging Brain 10x Genomics Single-cell RNA-seq Data

This package contains the processed 10x Genomics single-cell RNA-seq data from 
([Ximerakis et al., 2019](https://www.nature.com/articles/s41593-019-0491-3)) investigating the transcriptional profiles of aging within young and old mice brains.
Quality control and preprocessing were carried out as described in the Methods section of the paper. 
The processed dataset contains 37,089 cells and 14,699 features for 25 cell types. 



#### 2. Ximerakis & Holton et al. 2023 Parabiosis 10x Genomics Single-cell RNA-seq Data

The second data set includes 10x Genomics single-cell RNA-seq data from 
([Ximerakis & Holton et al., 2023](https://www.nature.com/articles/s43587-023-00373-6)) investigating parabiosis as an aging intervention.
Once again, quality control and preprocessing were carried out as described in the Methods section of the paper. 
The processed dataset contains 
105,329 cells and 20,905 features for 31 cell types. Low quality cells and 
animals were removed following the paper's methods resulting in 8 OX, 8 YX, 
7 YY, 9 YO, 7 OO, 11 OY animals.

<br> 

This package includes gene counts, cell annotation, and reduced-dimension 
representations as separate components of the processed data, that are served
in an integrated `SingleCellExperiment` object.


<br>


#### References

1. Ximerakis, M., Lipnick, S.L., Innes, B.T. et al. Single-cell transcriptomic profiling of the aging mouse brain. *Nat Neurosci* __22__, 1696–1708 (2019). [https://doi.org/10.1038/s41593-019-0491-3](https://www.nature.com/articles/s41593-019-0491-3)


2. Ximerakis, M., Holton, K.M., Giadone, R.M. et al. Heterochronic parabiosis 
reprograms the mouse brain transcriptome by shifting aging signatures in 
multiple cell types. *Nat Aging* __3__, 327–345 (2023). 
[https://doi.org/10.1038/s43587-023-00373-6](https://doi.org/10.1038/s43587-023-00373-6)


