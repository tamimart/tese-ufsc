library(dplyr)
library(readxl)

resumo <- read_xlsx(here::here("dados/dados_penguins.xlsx")) |>
  group_by(species) |>
  summarise(
    media   = mean(bill_length_mm, na.rm = TRUE),
    desvio  = sd(bill_length_mm, na.rm = TRUE),
    mediana = median(bill_length_mm, na.rm = TRUE),
    iqr = IQR(bill_length_mm, na.rm = TRUE)
  )