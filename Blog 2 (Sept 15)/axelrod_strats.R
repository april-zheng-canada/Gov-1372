library(stringr)
library(tibble)
library(openxlsx)

strat_files <- list.files("./axelRod-master/inst/Strategies")
strats <- tibble(strategy = rep(NA_character_, length(strat_files)), 
                 description = rep(NA_character_, length(strat_files)))
for(i in 1:length(strat_files)) {
  strat_name <- str_extract(strat_files[i], ".+(?=\\.R)")
  file_name <- paste0("./axelRod-master/inst/Strategies/", strat_files[i])
  strat_text <- readChar(file_name, file.info(file_name)$size)
  strat_text <- gsub("    ", "", strat_text)
  strat_desc <- gsub(".*Strategy rules:\\n#'(.+)\\n#'\\n.*", "\\1", strat_text) %>% 
    gsub("\\n#'", "", .) %>% 
    gsub("\\.(\\d)", "\\. \\1", .)
  strats[i, 1] <- strat_name
  strats[i, 2] <- strat_desc
}

write.xlsx(strats, "axelrod_strategies.xlsx", overwrite = T)
