library(ggplot2)

x = read.table("stats.txt", header=FALSE, sep="\t")

p <- ggplot(subset(x, V4 != -1 & V2 != 'Illumina HiSeq 2000' & V2 != '454 GS FLX'))
p <- p + geom_point(aes(x=V4, y=as.numeric(V4)*as.numeric(V3)/1000, colour=V2))
p <- p + scale_x_log10("Read length, log10-scale")
p <- p + scale_y_log10("Run throughput, log10-scale")
p <- p + scale_colour_brewer(palette="Set1")
p <- p + theme_bw()
p <- p + theme(axis.text.y=element_text(size=20))
p <- p + theme(axis.title.y=element_text(size=20))
p <- p + theme(axis.title.x=element_text(size=20))
p <- p + theme(legend.text=element_text(size=20))
p <- p + theme(legend.title=element_text(size=20))

ggsave("runs_by_length_and_throughput.pdf", p, width=10, height=6)
