library(openxlsx)
library(dplyr)
library(stringr)
library(gdata)
library(grepl)
setwd("/R-Playground/sample-data/merge-files/xlsx")
merge_file_name <- "merged_file.xlsx"
# for csv read.csv(i, headers=TRUE)

filenames <- list.files(full.names=TRUE)

All <- lapply(filenames,function(i){
  if(grepl(merge_file_name,i)) {
    print("ignoring final merge  file")
  } 
  else {
    print(paste("Merging",i,sep = " "))
    read.xlsx(i)
  }
})

df <- do.call(rbind.data.frame, All)
write.xlsx(df,merge_file_name)
