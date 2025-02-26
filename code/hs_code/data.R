here::i_am(
  "code/hs_code/data.R"
)

data_filepath = Sys.getenv("ENG_PATH") 

df<-read.csv(
  here::here(data_filepath))

for(i in 2:nrow(df)) {
  if(df$length[i] == "01:04:56"){
    df$length[i] <-"64:56"
  }
  
}
df


df$length<-sapply(strsplit(df$length,":"),
                  function(x) {
                    x <- as.numeric(x)
                    x[1]+x[2]/60
                  }
)

saveRDS(
  df,
  file = here::here("data/data_clean.rds")
)
