path <- "sample-data/merge-files/csv"
merge_file_name <- "sample-data/merge-files/merged_file.csv"

filenames <- list.files(path= path, full.names=TRUE)

All <- lapply(filenames,function(filename){
    print(paste("Merging",filename,sep = " "))
    read.csv(filename)
})

df <- do.call(rbind.data.frame, All)
write.csv(df,merge_file_name)

