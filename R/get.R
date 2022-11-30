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
