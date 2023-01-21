# Aqui ficarão as bases, anotações, descobertas etc.
# Farei chamadas em alto nível aqui.

# Abrangência espacial: Brasil

# Hipótese:
# 1 - O aumento do número de pessoas vacinadas contra covid-19 diminui a quantidade de hospitalizações causados por essa doença.
# 1a - Em que proporção?
#   1b - Analisar espacialmente a correlação, se existente, entre o tempo decorrido na massificação da vacinação e a diminuição das hospitalizações
# 2 - O aumento do número de pessoas vacinadas contra covid-19 diminui a quantidade de óbitos causados por essa doença
#   2a - Analisar espacialmente a correlação, se existente, entre o tempo decorrido na massificação da vacinação e a diminuição dos óbitos
# 3 - Se houver tempo, analisar a correlação segmentando por faixa etária, comorbidades, sexo, temporalidade das doses,
#     tipo/fabricante da vacina, intervalo entre disponibilização das vacinas e massificação e hospitalizações

# Perguntas:
# 1 - Existem clusters de vacinações / hospitalizações?
# 2 - Temos dados para averiguar se existem diferenças dentro de um mesmo município? 
# Extra 1 - Flexibilizações como abolir uso de máscara ou permissão de eventos com aglomeração influenciam os comportamentos?

# Dados necessários:

# Vacinação
#   Verificar se os dados disponibilizados aqui são adequados:
#   https://opendatasus.saude.gov.br/dataset/covid-19-vacinacao
#     Baixando o RJ:
#       https://opendatasus.saude.gov.br/dataset/covid-19-vacinacao/resource/10aed154-04c8-4cf4-b78a-8f0fa1bc5af4
#library(readr)
#amostra <- read_delim("~/Desktop/Guarda/personal/MBA/TCC/vacinacao_covid/tabelas/RJ/amostra.csv", 
#                      delim = ";", escape_double = FALSE, col_types = cols(paciente_idade = col_integer(), 
#                                                                           paciente_dataNascimento = col_date(format = "%Y-%m-%d"), 
#                                                                           paciente_enumSexoBiologico = col_factor(levels = c("M", 
#                                                                                                                              "F")), vacina_dataAplicacao = col_date(format = "%Y-%m-%d")), 
#                      trim_ws = TRUE)
#View(amostra)
# zcat RJ*.gz | cut -d\; -f2 | sort | uniq -c | cut -f1 | sort -r | head -n 11 > top10

### Os dados são muito grandes. Para o Rio de Janeiro haviam 3 arquivos de cerca de 6GB cada.
### Pesquisei alguns métodos para lidar com Big Data em R e encontrei basicamente o pacote Arrow
### que tem limitações como fazer o collect() in memory. Vi umas coisas interessantes sobre
### converter arquivos csv gigantes e em um diretório parquet, mas aparentemente isso não
### será suficiente.
### Assim, provavelmente recorrerei a alguns programas linux para agregar os dados raw.
### Afinal de contas, a localização mais granular é a dos pontos de vacinação, e não cada paciente

### MAAAASSSSS: Já que vou agregar os dados, talvez valha mais a pena extrair as agregações
### diretamente da API Elastic do Ministério da Saúde

# **********************************************************************************
# Obter quantidades de aplicações agrupadas por CNES/dia.
# Começarei limitando a um município


# Hospitalização
# Morbidade
# Malha espacial
# Extra 1: Dados sobre flexibilização

# Etapas

# 



# Fontes a analisar:
# https://opendatascience.eu/r-training/
# http://mybinder.org/
# https://r-spatial.org/r/2022/04/12/sftime-1.html
# https://hub.gke2.mybinder.org/user/robinlovelace-geocompr-jnuop8tv/rstudio/
# https://cran.r-project.org/web/packages/DCluster/index.html
# https://cran.r-project.org/web/packages/DClusterm/index.html
# https://cran.r-project.org/web/packages/spdep/vignettes/CO69.html
# https://cran.r-project.org/web/packages/spdep/index.html
# https://cran.r-project.org/web/packages/SpatialEpi/index.html
# https://cran.r-project.org/web/packages/lctools/index.html
# https://cran.r-project.org/web/views/SpatioTemporal.html
# https://oscarperpinan.github.io/rastervis/
# https://www.jstatsoft.org/article/view/v025c01

# Artigos
# https://www.mdpi.com/2077-0383/11/5/1191
# The Impact of SARS-CoV-2 Primary Vaccination in a Cohort of Patients Hospitalized for Acute COVID-19 during Delta Variant Predominance

# https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(22)00462-7/fulltext
# Comparative analysis of the risks of hospitalisation and death associated with SARS-CoV-2 omicron (B.1.1.529) and delta (B.1.617.2) variants in England: a cohort study

# https://www.nature.com/articles/s41579-020-00459-7
# Characteristics of SARS-CoV-2 and COVID-19 - Boa estória do coronavirus, ilustrada com bons infograficos

# https://www.nejm.org/doi/full/10.1056/nejmoa2107715
# Effectiveness of an Inactivated SARS-CoV-2 Vaccine in Chile

# https://www.pnas.org/doi/10.1073/pnas.2111870119
# Real-time pandemic surveillance using hospital admissions and mobility data
