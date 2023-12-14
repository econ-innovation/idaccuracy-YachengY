path <- "D:/bigdataEcon/data/assignment_idaccuracy/Aminer"

merge_csv_files <- function(path) {
  files <- list.files(path, pattern = "\\.csv$", full.names = TRUE)
  data_list <- lapply(files, read.csv)
  
  merged_df <- do.call(rbind, data_list)

    required_columns <- c("doi", "标题", "期刊", "年份")
  merged_df <- merged_df[required_columns]
  
  # 转换年份列为数值型
  merged_df$年份 <- as.numeric(as.character(merged_df$年份))
  
  return(merged_df)
}

result_df <- merge_csv_files(path)
print(result_df)
result_df