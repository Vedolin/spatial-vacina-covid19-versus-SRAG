# Obtém vacinas aplicadas por municipio de RJ

programa_imunizacao <- paste(getwd() , "/imunizacao_api.R", sep = "")
source(programa_imunizacao)


# doses_por_cnes <- doses_por_cnes("RJ")
doses_aplicadas_por_municipio <- doses_por_municipio("RJ")

# doses_aplicadas_por_municipio %>% filter(CODUFMUN != '330455') %>%  plot()
# hist((doses_aplicadas_por_municipio %>% filter(CODUFMUN != '330455'))$doses_aplicadas)
