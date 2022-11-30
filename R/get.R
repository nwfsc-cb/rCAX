updateddata<-httr::content(
  httr::GET('https://apex.psmfc.org/akfin/data_marts/akmp/baranof_avg_sst?start_date=20220117&end_date=20221231'), 
  type = "application/json") %>% 
  bind_rows
