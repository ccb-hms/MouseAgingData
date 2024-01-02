## Helper function to get an ExperimentHub record
.get_ExperimentHub <- function(hub, title) {
  res <- hub[hub$title == title]
  return(res)
}
