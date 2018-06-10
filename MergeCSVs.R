library(openxlsx)
library(dplyr)
library(stringr)
library(gdata)
library(grepl)

path <- "sample-data/merge-files/csv"
merge_file_name <- "sample-data/merge-files/csv/merged_file.csv"
# for csv read.csv(i, headers=TRUE)

filenames <- list.files(path= path, full.names=TRUE)

All <- lapply(filenames,function(i){
  if(grepl(merge_file_name,i)) {
    print("ignoring final merge  file")
  } 
  else {
    print(paste("Merging",i,sep = " "))
    read.csv(i)
  }
})

df <- do.call(rbind.data.frame, All)
write.csv(df,merge_file_name)

