# http://moderndata.plot.ly/connecting-r-to-mysql-mariadb/ ... _AWS_

install.packages("RMySQL");
library(RMySQL);
"package:RMySQL" %in% search();

x <- 5;

library(help = RMySQL);

cramdb <- dbConnect(RMySQL::MySQL(), dbname = "cram", username="root", localhostpassword="nopass")
cramdb;

dbListConnections();

dbListTables(cramdb);
dbDisconnect(cramdb);
cramdb <- dbConnect(RMySQL::MySQL(), dbname = "cram", username="root", password="nopass")

# Troubleshooting interactivity:
# dbListConnections(drv, ...)
# 
# 

dbFetch(dbSendQuery(cramdb, "select * from timepoints;"))

dbFetch(dbSendQuery(cramdb, "select * FROM time_metrics;"))

dbFetch(dbSendQuery(cramdb, "show databases"))

dbSendQuery(cramdb, "delete from timepoints where scientist = 'DPA'") 

dbSendQuery(cramdb, "insert into timepoints values(1, 'DPA', 40, 50, 110, 150)")




#dbListResults(cramdb)
