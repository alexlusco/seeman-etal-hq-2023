pacman::p_load(dplyr, readr)

files <- list.files("data/raw/", pattern = ".csv$", full.names = TRUE)

reddit_df <- lapply(files, read_csv)

reddit_df <- bind_rows(reddit_df) %>% bind_rows() %>% distinct(body, .keep_all = TRUE)

write_csv(reddit_df, "data/raw/master_df.csv")
