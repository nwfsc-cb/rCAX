updateddata<-httr::content(
  httr::GET('https://apex.psmfc.org/akfin/data_marts/akmp/baranof_avg_sst?start_date=20220117&end_date=20221231'), 
  type = "application/json") %>% 
  bind_rows

GET(
  "https://api.streamnet.org/api/v1/users",
  authenticate("user", "passwd")
)

apikey <- GET(
  "https://api.streamnet.org/api/v1/users",
  query = list(email = "email", password = "password")
  )

httr::content(
httr::GET('https://api.streamnet.org/api/v1/ca/tables'),
type = "application/json")


secret <- jsonlite::base64_enc( readChar("Callahan_token.txt",nchars=1e6) ) 
# Get token from API
req <- httr::POST("https://apex.psmfc.org/akfin/data_marts/oauth/token",
                  httr::add_headers(
                    "Authorization" = paste("Basic", gsub("\n", "", secret)),
                    "Content-Type" = "application/x-www-form-urlencoded;charset=UTF-8"
                  ),
                  body = "grant_type=client_credentials"
);

#  Create authentication error message
httr::stop_for_status(req, "Something broke.")
token <- paste("Bearer", httr::content(req)$access_token)

#Actual API call  
age<-fromJSON(content(
  GET('https://apex.psmfc.org/akfin/data_marts/akm/get_lls_age_view?startyear=2019&endyear=2020',
      add_headers(Authorization = token)), 
  as="text")) %>% 
  bind_rows


nosa = httr::GET("https://api.streamnet.org/api/v1/ca.json?table_id=4EF09E86-2AA8-4C98-A983-A272C2C2C7E3&XApiKey=7A2F1EA9-4882-49E8-B23D-7DC202C2ACA5&page=1&per_page=10")

data = jsonlite::fromJSON(rawToChar((nosa$content)))

tab = httr::GET("https://api.streamnet.org/api/v1/ca/1AF2395A-DF16-8615-89AC-409751DA10E4?XApiKey=7A2F1EA9-4882-49E8-B23D-7DC202C2ACA5")
data = jsonlite::fromJSON(rawToChar((tab$content)))$record_values

b <- rcax_table_query("XPortCA_NOSA_01")
