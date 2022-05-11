## code to prepare `DATASET` dataset goes here
#Source: https://coolbutuseless.github.io/2018/12/10/r-packages-internal-and-external-data/

data1 <- readr::read_csv("data-raw/OfficalCanadaFish.csv")
removeColNA <- data1[,colSums(is.na(data1))<nrow(data1)]
SPECIES <- removeColNA[rowSums(is.na(removeColNA))<ncol(removeColNA),]
rm(data1,removeColNA)

usethis::use_data(SPECIES, overwrite = TRUE, internal = TRUE)
