require("rvest")
ticker = "AAPL"

getFin = function(ticker)
{
  url = paste0("https://finance.yahoo.com/quote/",ticker,
               "/key-statistics?p=",ticker)
  a <- read_html(url)
  tbl = a %>% html_nodes("section") %>% html_nodes("div") %>% 
        .[6] %>% html_nodes("table")
  
  valMsrs      = tbl %>% .[1] %>% html_table() %>% as.data.frame()
  stkPrcHist   = tbl %>% .[2] %>% html_table() %>% as.data.frame()
  shrStats     = tbl %>% .[3] %>% html_table() %>% as.data.frame()
  divsSplits   = tbl %>% .[4] %>% html_table() %>% as.data.frame()
  fiscYr       = tbl %>% .[5] %>% html_table() %>% as.data.frame()
  prof         = tbl %>% .[6] %>% html_table() %>% as.data.frame()
  mgtEff       = tbl %>% .[7] %>% html_table() %>% as.data.frame()
  incSt        = tbl %>% .[8] %>% html_table() %>% as.data.frame()
  balSheet     = tbl %>% .[9] %>% html_table() %>% as.data.frame()
  cshFlow      = tbl %>%.[10] %>% html_table() %>% as.data.frame()
  
  info1 = rbind(stkPrcHist,shrStats,divsSplits,fiscYr,prof,
                mgtEff,incSt,balSheet,cshFlow)
  list(info1, valMsrs)
}

tmp = getFin("GOOGL")
tbl1 = tmp[[1]]
tbl2 = tmp[[2]]
























