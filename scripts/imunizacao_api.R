library(elastic)
library(dplyr)

doses_por_cnes <- function (UF) {
  qbody <-
    paste('{
  "query": {

        "bool": {
"must": [{
          "match": {
              "status":"final"
          }
      }, {
          "match": {
              "estabelecimento_uf": "',

UF,
'"
          }
      }]
        
      }
    
  },
  "aggs": {
        "por_cnes": {
          "terms": {
            "field": "estabelecimento_valor",
            "size":10000
          }
    }
  },
  "size": 0
}',
sep = "")
  
  conn <- elastic::connect(
    host = "imunizacao-es.saude.gov.br",
    port = 443,
    path = NULL,
    transport_schema = "https",
    user = "imunizacao_public",
    pwd = "qlto5t&7r_@+#Tlstigi",
    headers = NULL,
    cainfo = NULL,
    force = FALSE,
    errors = "simple",
    warn = TRUE,
    ignore_version = FALSE
  )
  
  
  resposta <- elastic::Search(
    conn,
    q = NULL,
    search_type = "query_then_fetch",
    body = qbody,
    track_total_hits = TRUE,
    search_path = "_search"
    # size = "100"
    , asdf = TRUE
  )
  
  
  
  list_doses_por_cnes <- resposta$aggregations$por_cnes$buckets
  
  # cat("cnes:", resposta$aggregations$por_cnes$buckets[[2]]$key , " -> vacinas aplicadas:", resposta$aggregations$por_cnes$buckets[[2]]$doc_count)
  # cat("cnes:", list_cnes_aplicacoes[[2]]$key , " -> vacinas aplicadas:", list_cnes_aplicacoes[[2]]$doc_count)
  
  doses_por_cnes <- as.data.frame(do.call(cbind, list_doses_por_cnes))
  
  
  
  doses_por_cnes <-
    doses_por_cnes %>%
    rename(cnes = key, doses_aplicadas = doc_count) %>%
    mutate(doses_aplicadas = as.numeric(doses_aplicadas))
  
  
  rm(list_doses_por_cnes, resposta, conn, qbody)
  # class(cnes_aplicacoes)
  
  return(doses_por_cnes)
  
}


# qbody <- '{
#   "size": 0,
#   "query": {
#     "bool": {
#       "filter": [
#         {
#           "range": {
#             "vacina_dataAplicacao": {
#               "gt": "2021-05-03T00:00:00.000Z",
#               "lt": "2022-07-07T00:00:00.000Z"
#             }
#           }
#         },
#         {
#           "term": {
#             "estabelecimento_municipio_codigo": "330340"
#           }
#         }
#       ]
#     }
#   },
#   "aggs": {
#     "por data": {
#       "terms": {
#         "field": "vacina_dataAplicacao"
#       },
#       "aggs": {
#       "Tipo dose": {
#       "terms": {
#         "field": "vacina_descricao_dose"
#       }
#     }
#     }
#     }
#   }
# }'




doses_por_municipio <- function (UF) {
  qbody <-
    paste('{
  "query": {

        "bool": {
"must": [{
          "match": {
              "status":"final"
          }
      }, {
          "match": {
              "estabelecimento_uf": "',

UF,
'"
          }
      }]
        
      }
    
  },
  "aggs": {
        "por_municipio": {
          "terms": {
            "field": "estabelecimento_municipio_codigo",
            "size":10000
          }
    }
  },
  "size": 0
}',
sep = "")
  
  conn <- elastic::connect(
    host = "imunizacao-es.saude.gov.br",
    port = 443,
    path = NULL,
    transport_schema = "https",
    user = "imunizacao_public",
    pwd = "qlto5t&7r_@+#Tlstigi",
    headers = NULL,
    cainfo = NULL,
    force = FALSE,
    errors = "simple",
    warn = TRUE,
    ignore_version = FALSE
  )
  
  
  resposta <- elastic::Search(
    conn,
    q = NULL,
    search_type = "query_then_fetch",
    body = qbody,
    track_total_hits = TRUE,
    search_path = "_search"
    # size = "100"
    , asdf = TRUE
  )
  
  
  
  list_doses_agregadas <- resposta$aggregations$por_municipio$buckets
  
  # cat("cnes:", resposta$aggregations$por_cnes$buckets[[2]]$key , " -> vacinas aplicadas:", resposta$aggregations$por_cnes$buckets[[2]]$doc_count)
  # cat("cnes:", list_cnes_aplicacoes[[2]]$key , " -> vacinas aplicadas:", list_cnes_aplicacoes[[2]]$doc_count)
  
  doses_agregadas <- as.data.frame(do.call(cbind, list_doses_agregadas))
  
  
  
  doses_agregadas <-
    doses_agregadas %>%
    rename(CODUFMUN = key, doses_aplicadas = doc_count) %>%
    mutate(doses_aplicadas = as.numeric(doses_aplicadas))
  
  
  # rm(list_doses_por_cnes, resposta, conn, qbody)
  # class(cnes_aplicacoes)
  
  return(doses_agregadas)
  
}


