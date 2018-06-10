library(openxlsx)
library(dplyr)
library(stringr)
library(gdata)
library(grepl)

path <- "sample-data/merge-files/xlsx"
merge_file_name <- "sample-data/merge-files/xlsx/merged_file.xlsx"
# for csv read.csv(filename, headers=TRUE)

filenames_list <- list.files(path= path, full.names=TRUE)

All <- lapply(filenames_list,function(filename){
  if(grepl(merge_file_name,filename)) {
    # returns NULL for this case
  } 
  else {
    print(paste("Merging",filename,sep = " "))
    read.xlsx(filename)
  }
})

df <- do.call(rbind.data.frame, All)
write.xlsx(df,merge_file_name)

