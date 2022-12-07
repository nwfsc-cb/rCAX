

nosa = httr::GET("https://api.streamnet.org/api/v1/ca.json?table_id=4EF09E86-2AA8-4C98-A983-A272C2C2C7E3&XApiKey=7A2F1EA9-4882-49E8-B23D-7DC202C2ACA5&page=1&per_page=10")

data = jsonlite::fromJSON(rawToChar((nosa$content)))

tab = httr::GET("https://api.streamnet.org/api/v1/ca/tables?XApiKey=7A2F1EA9-4882-49E8-B23D-7DC202C2ACA5")
data = jsonlite::fromJSON(rawToChar((tab$content)))

tab = httr::GET("https://api.streamnet.org/api/v1/ca/1AF2395A-DF16-8615-89AC-409751DA10E4?XApiKey=7A2F1EA9-4882-49E8-B23D-7DC202C2ACA5")
data = jsonlite::fromJSON(rawToChar((tab$content)))$record_values

tab = httr::GET("https://api.streamnet.org/api/v1/ca/1AF2395A-DF16-8615-89AC-409751DA10E4?XApiKey=C4F5F084-EBE3-4ED6-8AF1-125EC54E6E52")
data = jsonlite::fromJSON(rawToChar((tab$content)))$record_values


b <- rcax_table_query("XPortCA_NOSA_01")

b <- rcax_table_query("XPortCA_SAR_01")


