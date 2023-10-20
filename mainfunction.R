library(tidyverse)
library(janitor)

source("helpfunctions.R")

restructure_gcmspostrun_rawdata <- function(filepath, delimiter = ","){
  filename <- str_extract(filepath, "[\\w-]+?(?=\\.)")
  filepath_wo_extensions <- str_extract(filepath, ".+(?=\\.\\w{3})")
  #path <- str_extract(filepath, )
  #filename <- str_extract(filepath, )
  # read in the data
  data <- read_csv_clean(filepath)
  data.tidy <- tidy_rawdata(data)
  
  samplenames_all <- get_samplenames(data)
  vector_allsamples_names <- vector_samplenames(filepath, samplenames_all, nrow(data.tidy))
  
  save_finished_data(tidy.data = data.tidy, 
                     samplenames = vector_allsamples_names, 
                     filepath = filepath_wo_extensions)
}