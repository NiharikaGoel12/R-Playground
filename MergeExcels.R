library(openxlsx)

path <- "sample-data/merge-files/xlsx"
merge_file_name <- "sample-data/merge-files//merged_file.xlsx"

filenames_list <- list.files(path= path, full.names=TRUE)

All <- lapply(filenames_list,function(filename){
    print(paste("Merging",filename,sep = " "))
    read.xlsx(filename)
})

df <- do.call(rbind.data.frame, All)
write.xlsx(df,merge_file_name)

