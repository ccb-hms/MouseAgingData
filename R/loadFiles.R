loadFiles <- function(file_type, tissue, directory) {

  mydir <- paste0(directory)

  # Get a list of files in the directory
  file_list <- list.files(mydir, full.names = TRUE)

  if (file_type == "matrix") {

    # Filter files containing the word "Muscle" and ending with ".mtx.gz"
    tissue_file <- subset(file_list, grepl(tissue, file_list) & grepl(file_type, file_list))
    tissue_file

    # Get sample names from files
    mytitles <- basename(tissue_file) # get just the file's name
    names <- sub("_[a-z]*.[a-z]*.gz", "", mytitles) # Grab only Sample name and tissue
    names

    # Read in the filtered files
    tissue_data <- lapply(tissue_file, Matrix::readMM)
    names(tissue_data) <- names # assign sample names


  } else {


    # Filter files containing the word "Muscle" and ending with ".mtx.gz"
    tissue_file <- subset(file_list, grepl(tissue, file_list) & grepl(file_type, file_list))
    tissue_file

    # Get sample names from files
    mytitles <- basename(tissue_file) # get just the file's name
    names <- sub("_[a-z]*.tsv.gz", "", mytitles) # Grab only Sample name and tissue
    names

    # Read in the filtered files
    tissue_data <- lapply(tissue_file, read.delim, as.is=T, sep="\t", header=F)
    names(tissue_data) <- names # assign sample names

  }

  return(tissue_data)
}
