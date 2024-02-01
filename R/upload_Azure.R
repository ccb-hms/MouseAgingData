library("AzureStor")

sas <- "sp=racwl&st=2024-01-29T12:59:03Z&se=2024-02-05T20:59:03Z&spr=https&sv=2022-11-02&sr=c&sig=YCgGp0wH22nFGtMU7DJ%2BPiZqpdPyqafVRteoIj2XzcM%3D"

url <- "https://bioconductorhubs.blob.core.windows.net"

ep <- storage_endpoint(url, sas = sas)
ep
container <- storage_container(ep, "staginghub")


# For locally available data use storage_multiupload. If your data files are in a local path /home/user/mypackage/data and assuming the name of your package is mypackage then you would use something like the following call:

# Grab file names and the local file path
files <- dir("~/Desktop/Final_aging_data/", recursive=TRUE)
src <- dir("~/Desktop/Final_aging_data", recursive=TRUE, full.names=TRUE)

# dest is the path destination of package on Azure?
dest <- paste0("MouseAgingData/", files)
storage_multiupload(container, src=src, dest=dest)


