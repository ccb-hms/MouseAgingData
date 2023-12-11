#' Get data from web repository via a URL link
#'
#' @param format A character string. Describes input file format, "tsv", "csv", or "mtx".
#' @param url A character string. Full URL to file hosted on a web repository.
#' @param destination A character string. Local destination to download file.
#' @param gzipped Boolean. Describes whether web file is gzipped. Defaults to TRUE.
#' @param sep The field separator character. Follow values documented in read.table function.
#' @param headers A logical value indicating whether the file contains the names of the variables as its first line. Again, refer to read.table function.
#'
#' @return A data frame or matrix.
#' @export
#'
#' @examples
#' test <- getWebData(format = "tsv", destination = "~/Desktop/", url = "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE222nnn/GSE222510/suppl/GSE222510_processed_barcodes.tsv.gz", header=F)
#' head(test)
getWebData <- function(format, url, destination, gzipped = TRUE, sep = "\t", headers = T){
  writeLines(paste0("Loading in", format, "file from the Web to local location:", destination,".\n"))

  ### Get file name URL

  # Extract substring between the last "/" and before the first period at the end
  substring <- sub(".*/", "", url)
  file_string <- sub("\\..*", "", substring)

  destination <- paste0(destination, substring)

  if (gzipped) {

    if (format == "csv") { # csv and gzip
      download.file(url, destination)
      gzresult <- read.csv(gzfile(destination), sep = sep, header = header)

    } else if (format == "mtx") { # mtx and gzip
      download.file(url, destination)
      gzresult <- Matrix::readMM(gzfile(destination))

    } else if (format == "tsv") { # tsv and gzip
      download.file(url, destination)
      gzresult <- read.table(gzfile(destination), sep = sep, header = header)

    } else {
      writeLines("File format not supported or URL is incorrect.\n")

    }

    return(gzresult)

  } else {

    if (format == "csv") { # csv and gzip
      download.file(url, destination)
      result <- read.csv(destination, sep = sep, header = header)

    } else if (format == "mtx") { # mtx and gzip
      download.file(url, destination)
      result <- Matrix::readMM(destination)

    } else if (format == "tsv") { # tsv and gzip
      download.file(url, destination)
      result <- read.table(destination, sep = sep, header = header)

    } else {
      writeLines("File format not supported or URL is incorrect.\n")

    }

    return(result)

  }
}
