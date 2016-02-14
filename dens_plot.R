# Load values for PHEWAS and HapMap3 SNPs generated using LDSC meta data
#dat1 = read.table("hm3.vals",as.is=T)
#dat2 = read.table("phewas.vals",as.is=T)
#save(dat1,dat2,file="hist.rbin")

rbin = c("ldsc_phewas.rbin","ldsc_match.rbin")
fout = c("density_all.svg","density_matched.svg")

for ( i in 1:2 ) {
load( file=rbin[i] )

svg(fout[i],height=4,width=8)
par(bty="n",mfrow=c(1,2) )

t1 = dat1[,2]
t2 = dat2[,2]
t1 = t1[t1<500]
t2 = t2[t2<500]
d1 = density(t1) 
d2 = density(t2)

plot( d1 , col="gray" , lwd=2 , xlab="" , ylab="" , main="LD-score density" , type="n",yaxt="n")
polygon(d1,col="gray",border="gray")
polygon(d2,col="#FF000050",border="#FF000080")
legend("topright",fill=c("gray","red"),legend=c("All HapMap SNPs","Neandertal SNPs"),cex=0.75,bty="n")

t1 = dat1[,1]
t2 = dat2[,1]
d1 = density(t1)
d2 = density(t2)
ylim = range(c(d1$y,d2$y))

plot( d1 , col="gray" , lwd=2 , main="MAF density" , xlab="" ,ylab="" , type="n" , ylim=ylim,yaxt="n")
polygon(d1,col="gray",border="gray")
polygon(d2,col="#FF000050",border="#FF000080")
legend("topright",fill=c("gray","red"),legend=c("All HapMap SNPs","Neandertal SNPs"),cex=0.75,bty="n")

dev.off()
}
