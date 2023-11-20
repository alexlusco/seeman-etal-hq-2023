got <- c("the shot", "the jab", "the vaccine", "vaccinated", "vaxxed", "vaxed", "vaxd", "vacced", "boosted", "the booster", "my booster") # note that I was having problems with vax'd so I removed the apostrophe

output <- list()

for(g in got) {

  result <- paste("\"got", g)

  for(r in result) {

    closing_words <- c("because\"", "so\"", "since\"", "after\"", "cause\"")

    result2 <- paste(result, closing_words)
  }

  output[[g]] <- result2
}

output1 <- unlist(output)

################################

reason <- c("being", "getting")

output <- list()

for(r in reason) {

  result <- paste("\"reason for", r)

  for(r in result) {

    closing_words <- c("vaccinated\"", "jabbed\"", "boosted\"", "vaxxed\"", "vaxed\"", "vaxd\"") # note that I was having problems with vax'd so I removed the apostrophe

    result2 <- paste(result, closing_words)
  }

  output[[r]] <- result2
}

output2 <- unlist(output)

################################

reason <- c("taking", "getting", "having")

output <- list()

for(r in reason) {

  result <- paste("\"reason for", r)

  for(r in result) {

    closing_words <- c("vaccine\"", "jab\"", "shot\"", "booster\"")

    result2 <- paste(result, closing_words)
  }

  output[[r]] <- result
}

output3 <- unlist(output)

################################

dict_all <- c(output1, output2, output2) %>% tibble::as_tibble()

readr::write_csv(dict_all, "data/raw/query_terms.csv")
