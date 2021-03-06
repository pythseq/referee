#!/usr/bin/env Rscript
############################################################
# For Referee, 10.18
# Plot time and mem usage for Referee runs
# Gregg Thomas
############################################################

library(ggplot2)
cat("----------\n")

this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

in_data = read.csv("../data/referee-performance.csv", header=T)
time = subset(in_data, stat=="time")
mem = subset(in_data, stat=="max mem")
jsin_time = subset(in_data, stat=="time" & species=="j. sinuosa")
jsin_mem = subset(in_data, stat=="max mem" & species=="j. sinuosa")
# Manual entry of input files

jsin_time$value = (jsin_time$value/60)/60
time$value = (time$value/60)/60
 
time_p = ggplot(jsin_time, aes(x=procs, y=value, shape=factor(input.type))) +
    #geom_smooth(method='glm', color='#333333', fill="#d3d3d3", fullrange=T) +
    geom_point(aes(colour=factor(input.type)), size=4) +
    geom_line(aes(colour=factor(input.type)), size=1, linetype=3) +
    labs(x=paste("# processes"), y=paste("Runtime (hours)"), shape="Input type", color="Input type") +
    theme_classic() +
    scale_color_manual(values=c("#db6d00","#920000","#009292")) +
    theme(axis.text=element_text(size=10), 
            axis.title=element_text(size=12), 
            axis.title.y=element_text(margin=margin(t=0,r=20,b=0,l=0),color="black"), 
            axis.title.x=element_text(margin=margin(t=20,r=0,b=0,l=0),color="black"),
            axis.line=element_line(colour='#595959',size=0.75),
            axis.ticks=element_line(colour="#595959",size = 1),
            axis.ticks.length=unit(0.2,"cm")
            #legend.position="none"
    )

outfile = "../data/performance-plots/jsin-time.png"
ggsave(file=outfile, time_p, width=8, height=6, units="in")
print(time_p)

mem_p = ggplot(jsin_mem, aes(x=procs, y=value, shape=factor(input.type))) +
  #geom_smooth(method='glm', color='#333333', fill="#d3d3d3", fullrange=T) +
  geom_point(aes(colour=factor(input.type)), size=4) +
  geom_line(aes(colour=factor(input.type)), size=1, linetype=3) +
  labs(x=paste("# processes"), y=paste("Max memory usage (MB)"), shape="Input type", color="Input type") +
  theme_classic() +
  scale_color_manual(values=c("#db6d00","#920000","#009292")) +
  theme(axis.text=element_text(size=10), 
        axis.title=element_text(size=12), 
        axis.title.y=element_text(margin=margin(t=0,r=20,b=0,l=0),color="black"), 
        axis.title.x=element_text(margin=margin(t=20,r=0,b=0,l=0),color="black"),
        axis.line=element_line(colour='#595959',size=0.75),
        axis.ticks=element_line(colour="#595959",size = 1),
        axis.ticks.length=unit(0.2,"cm")
        #legend.position="none"
  )

outfile = "../data/performance-plots/jsin-mem.png"
ggsave(file=outfile, mem_p, width=8, height=6, units="in")
print(mem_p)

time_p = ggplot(time, aes(x=procs, y=value, shape=factor(input.type))) +
  #geom_smooth(method='glm', color='#333333', fill="#d3d3d3", fullrange=T) +
  geom_point(aes(colour=factor(input.type)), size=4) +
  geom_line(aes(colour=factor(input.type)), size=1, linetype=3) +
  labs(x=paste("# processes"), y=paste("Runtime (hours)"), shape="Input type", color="Input type") +
  theme_classic() +
  scale_color_manual(values=c("#db6d00","#920000","#009292","#490092")) +
  theme(axis.text=element_text(size=10), 
        axis.title=element_text(size=12), 
        axis.title.y=element_text(margin=margin(t=0,r=20,b=0,l=0),color="black"), 
        axis.title.x=element_text(margin=margin(t=20,r=0,b=0,l=0),color="black"),
        axis.line=element_line(colour='#595959',size=0.75),
        axis.ticks=element_line(colour="#595959",size = 1),
        axis.ticks.length=unit(0.2,"cm")
        #legend.position="none"
  )

outfile = "../data/performance-plots/time.png"
ggsave(file=outfile, time_p, width=8, height=6, units="in")
print(time_p)

mem_p = ggplot(mem, aes(x=procs, y=value, shape=factor(input.type))) +
  #geom_smooth(method='glm', color='#333333', fill="#d3d3d3", fullrange=T) +
  geom_point(aes(colour=factor(input.type)), size=4) +
  geom_line(aes(colour=factor(input.type)), size=1, linetype=3) +
  labs(x=paste("# processes"), y=paste("Max memory usage (MB)"), shape="Input type", color="Input type") +
  theme_classic() +
  scale_color_manual(values=c("#db6d00","#920000","#009292","#490092")) +
  theme(axis.text=element_text(size=10), 
        axis.title=element_text(size=12), 
        axis.title.y=element_text(margin=margin(t=0,r=20,b=0,l=0),color="black"), 
        axis.title.x=element_text(margin=margin(t=20,r=0,b=0,l=0),color="black"),
        axis.line=element_line(colour='#595959',size=0.75),
        axis.ticks=element_line(colour="#595959",size = 1),
        axis.ticks.length=unit(0.2,"cm")
        #legend.position="none"
  )

outfile = "../data/performance-plots/mem.png"
ggsave(file=outfile, mem_p, width=8, height=6, units="in")
print(mem_p)

