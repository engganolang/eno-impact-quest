library(tidyverse)

# quiz <- googlesheets4::read_sheet(ss = "https://docs.google.com/spreadsheets/d/1RwcZvbNbchAKh9zlpHxfCfnMmmUbsG69dgmzDV7N8uA/edit?usp=sharing",
#                                   range = "A1:V31")
# write_rds(quiz, "quiz.rds")
# write_tsv(quiz, "quiz.tsv")

quiz <- readr::read_rds("quiz.rds")
quiz_dbl <- quiz |> 
  select(1:5, where(is.numeric)) |> 
  pivot_longer(cols = -c(1:3, 5), names_to = "question", values_to = "response") |> 
  rename(nama = `1. Nama`,
         asal = `2. Asal`,
         mengajar_tingkat = `4. Mengajar di tingkat?`) |> 
  mutate(mengajar_tingkat_1 = mengajar_tingkat,
         mengajar_tingkat_1 = replace(mengajar_tingkat_1,
                                      !mengajar_tingkat_1 %in% c("SD", "SD, SMP",
                                                                 "SMA", "SMP"),
                                      "BUKAN GURU"))
quiz_dbl_1 <- quiz_dbl |> 
  filter(mengajar_tingkat_1 != "SD, SMP")
sd_smp <- quiz_dbl |> 
  filter(mengajar_tingkat_1 == "SD, SMP")
quiz_dbl <- quiz_dbl_1 |> 
  bind_rows(sd_smp |> 
              mutate(mengajar_tingkat_1 = replace(mengajar_tingkat_1,
                                                  mengajar_tingkat_1 == "SD, SMP",
                                                  "SD"))) |> 
  bind_rows(sd_smp |> 
              mutate(mengajar_tingkat_1 = replace(mengajar_tingkat_1,
                                                  mengajar_tingkat_1 == "SD, SMP",
                                                  "SMP"))) |> 
  mutate(mengajar2 = "non-teacher",
         mengajar2 = replace(mengajar2, mengajar_tingkat_1 == "SD", "elementary school teacher"),
         mengajar2 = replace(mengajar2, mengajar_tingkat_1 == "SMP", "junior high school teacher"),
         mengajar2 = replace(mengajar2, mengajar_tingkat_1 == "SMA", "senior high school teacher"))|> 
  mutate(mengajar2 = factor(mengajar2, levels = c("elementary school teacher",
                                                  "junior high school teacher",
                                                  "senior high school teacher",
                                                  "non-teacher"))) |> 
  mutate(mengajar3 = if_else(mengajar_tingkat_1 != "BUKAN GURU",
                             "teachers",
                             "non-teachers"),
         mengajar3 = factor(mengajar3, levels =c ("teachers", "non-teachers")))



quiz_chr <- quiz |> 
  select(1:3, where(is.character)) |> 
  pivot_longer(cols = -c(1:4), names_to = "question", values_to = "response") |> 
  rename(nama = `1. Nama`,
         asal = `2. Asal`,
         mengajar_tingkat = `4. Mengajar di tingkat?`) |> 
  mutate(mengajar_tingkat_1 = mengajar_tingkat,
         mengajar_tingkat_1 = replace(mengajar_tingkat_1,
                                      !mengajar_tingkat_1 %in% c("SD", "SD, SMP",
                                                                 "SMA", "SMP"),
                                      "BUKAN GURU"))

quiz_chr_1 <- quiz_chr |> 
  filter(mengajar_tingkat_1 != "SD, SMP")
sd_smp <- quiz_chr |> 
  filter(mengajar_tingkat_1 == "SD, SMP")
quiz_chr <- quiz_chr_1 |> 
  bind_rows(sd_smp |> 
              mutate(mengajar_tingkat_1 = replace(mengajar_tingkat_1,
                                                  mengajar_tingkat_1 == "SD, SMP",
                                                  "SD"))) |> 
  bind_rows(sd_smp |> 
              mutate(mengajar_tingkat_1 = replace(mengajar_tingkat_1,
                                                  mengajar_tingkat_1 == "SD, SMP",
                                                  "SMP"))) |> 
  mutate(mengajar2 = "non-teacher",
         mengajar2 = replace(mengajar2, mengajar_tingkat_1 == "SD", "elementary school teacher"),
         mengajar2 = replace(mengajar2, mengajar_tingkat_1 == "SMP", "junior high school teacher"),
         mengajar2 = replace(mengajar2, mengajar_tingkat_1 == "SMA", "senior high school teacher"))|> 
  mutate(mengajar2 = factor(mengajar2, levels = c("elementary school teacher",
                                                  "junior high school teacher",
                                                  "senior high school teacher",
                                                  "non-teacher"))) |> 
  mutate(mengajar3 = if_else(mengajar_tingkat_1 != "BUKAN GURU",
                             "teachers",
                             "non-teachers"),
         mengajar3 = factor(mengajar3, levels =c ("teachers", "non-teachers")))


