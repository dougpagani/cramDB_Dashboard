# RODBC

# http://moderndata.plot.ly/connecting-r-to-mysql-mariadb/ ... _AWS_

install.packages("RMySQL");
library(RMySQL);
"package:RMySQL" %in% search();

x <- 5;

library(help = RMySQL);

cramdb <- dbConnect(RMySQL::MySQL(max.con=1, fetch.default.rec=100), dbname = "cram", 
                    username="rstudio", password="rstudio")
cramdb <- dbConnect(RMySQL::MySQL(), dbname = "cram", username="rstudio", password="rstudio")
#cramdb <- dbConnect(RMySQL::MySQL(), dbname = "cram", username="root", password="nopass")
cramdb;
# Error, fignature missing
dbListConnections(RMySQL::MySQL());
dbDisconnect(dbListConnections(RMySQL::MySQL())[[1]]);
# close all connections
lapply(dbListConnections(RMySQL::MySQL()), dbDisconnect)
dbListTables(cramdb);
dbDisconnect(cramdb);

# Troubleshooting interactivity:
# dbListConnections(drv, ...)


# SHOUDLNT INSERT
data <- dbFetch(dbSendQuery(cramdb, "select * from timepoints;"))
data

dbGetQuery(cramdb, "call todoList()")
dbExecute(cramdb, "call todoList()")
dbSendQuery(cramdb, "call todoList()")
dbListResults(cramdb);
lapply(dbListResults(cramdb), dbClearResult);
dbGetRowsAffected()

dbGetQuery(cramdb, "call loginf()")
dbGetInfo(cramdb) #> gives a bunch of information


dbFetch(dbSendQuery(cramdb, "show databases"))

dbSendQuery(cramdb, "delete from timepoints where scientist = 'DPA'") 

dbSendQuery(cramdb, "insert into timepoints values(1, 'DPA', 40, 50, 110, 150)")
# Are these basically running on the cmd-line?
exit_code <- dbFetch(dbSendQuery(cramdb, "call login('DPA', 
                    'e77a58908f66bf61ac22e5d6131288c54295cfb97153d1bf180eff97f3b53232')"))
exit_code

dbCallProc(cramdb, "call login('DPA', 
                    'e77a58908f66bf61ac22e5d6131288c54295cfb97153d1bf180eff97f3b53232')")

result <- dbSendQuery(cramdb, "call todoList")
# Resturns the statement passed to dbSendQuery
dbGetStatement(result);

# Try to fix out-of-sync issue
dbBegin(cramdb);
dbGetQuery(cramdb, "call todoList");
dbCommit(cramdb);
    
#dbListResults(cramdb)
#
#
#dbFetch(rs) # fetch the result-set from the
# ... DBIResultSet-object f/ dbSendQuery()
# dbGetQuery() == dbSendQuery %>% dbFetch %>%  dbClearResults
# 
# dbListTables(con)
# dbExistsTable(con)
# Add a table f/ a local data frame:
# df <- data.frame(y = runif(5)) # random uniform distro
# dbWriteTable(con, "df", df)
# dbReadTable(con, "df")
# dbRemoveTable(con, "df")
# 
# 
# https://rstudio-pubs-static.s3.amazonaws.com/52614_1fa12c657ba7492092bd538205d7f02e.html
# 
# dbBegin(con1)
# dbCommit(con1)
# dbListTables(con2)
# dbCommit(con1)
# dbRollback(con1)
