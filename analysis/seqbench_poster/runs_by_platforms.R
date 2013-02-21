library(ggplot2)
library(RSQLite)

drv<-dbDriver("SQLite")
con<-dbConnect(drv, dbname="/Users/nick/work/seqbench/reads/seqbench.sqlite3")
runs<-dbGetQuery(con, "SELECT Platform FROM runs")

p<-ggplot(runs, aes(x=reorder(Platform, Platform, function(x)-length(x))))
p <- p + geom_bar()
p <- p + scale_x_discrete("Platform")
p <- p + scale_y_continuous("Number of samples")
p <- p + theme(axis.text.x=element_text(size=20))
p <- p + theme(axis.text.y=element_text(size=20))
p <- p + theme(axis.title.y=element_text(size=20))
p <- p + theme(axis.title.x=element_text(size=20))
p <- p + theme(legend.text=element_text(size=20))
p <- p + theme(legend.title=element_text(size=20))
p <- p + theme(axis.text.x = element_text(angle = 45, hjust = 1))
p <- p + theme_bw()

ggsave("number_of_runs_by_platform.pdf", p)

