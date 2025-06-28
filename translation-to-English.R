
source("pre-processing.R")
source("C:/Users/GRajeg/OneDrive - Nexus365/Documents/Research/kahler1987-2023-06-10/code/0-directory.R")

# q8a <- quiz_chr |> 
#   filter(str_detect(question, "^Terkait")) |> 
#   filter(!is.na(response))
# q8a_resp <- deeplr::translate2(q8a$response,
#                                source_lang = "ID", split_sentences = FALSE,
#                                preserve_formatting = TRUE, auth_key = deeplkey)
# q8a <- q8a |> 
#   mutate(resp_trans = q8a_resp)
# q8a |> 
#   write_tsv("q8-trans-to-edit.tsv")


# q12 <- quiz_chr |>
#   filter(str_detect(question, "^12")) |>
#   filter(!is.na(response))
# q12_resp <- deeplr::translate2(q12$response,
#                                source_lang = "ID", 
#                                split_sentences = FALSE,
#                                preserve_formatting = TRUE, 
#                                auth_key = deeplkey)
# q12 <- q12 |>
#   mutate(resp_trans = q12_resp)
# q12 |>
#   write_tsv("q12-trans-to-edit.tsv")

# q20 <- quiz_chr |> 
#   filter(str_detect(question, "^20")) |> 
#   filter(!is.na(response))
# q20_resp <- deeplr::translate2(q20$response,
#                                source_lang = "ID",
#                                split_sentences = FALSE,
#                                preserve_formatting = TRUE,
#                                auth_key = deeplkey)
# q20 <- q20 |> 
#   mutate(resp_trans = q20_resp)
# q20 |> 
#   write_tsv("q20-trans-to-edit.tsv")
