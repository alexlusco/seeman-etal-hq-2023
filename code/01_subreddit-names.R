pacman::p_load(rvest, tibble, dplyr, readr)

subreddits <-  read_html("https://www.reddit.com/r/ListOfSubreddits/comments/m2x58n/all_canada_subreddits/") %>%
  html_nodes("._3t5uN8xUmg0TOwRCOGQEcU") %>%
  html_text() %>%
  as_tibble()

subreddits <- subreddits %>%
  filter(str_detect(value, "^r/")) %>%
  mutate(value = str_remove(value, "r/"))

write_csv(subreddits, "data/raw/subreddits.csv")
