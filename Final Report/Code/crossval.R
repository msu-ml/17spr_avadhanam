## CROSS VALIDATION CODE 

samp_vec <- c(1:1814)

#Create 5 testing/training lots
tst1 <-sample(samp_vec,size=350,replace=FALSE) 
tst2 <- sample(samp_vec[-tst1],size=350,replace=FALSE)
tst3 <- sample(samp_vec[-c(tst2,tst1)],size=350,replace=FALSE)
tst4 <- sample(samp_vec[-c(tst3,tst2,tst1)],size=350,replace=FALSE)
tst5 <- sample(samp_vec[-c(tst4,tst3,tst2,tst1)],size=350,replace=FALSE)


yNA[tst]<-NA #Use this for training by excluding the relevant testing group.

gHat<-X%*%fmBAL$ETA$MRK$b 
plot(fmBAL$y~gHat,ylab="Phenotype", 
     xlab="Predicted Genomic Value", col=2, cex=0.5,  
     main="Predicted Genomic Values Vs Phenotypes", 
     xlim=range(gHat),ylim=range(fm$y));  

varE<-scan("varE.dat") 
plot(varE,type="o",col=2,cex=.5, 
     ylab=expression(sigma[epsilon]^2), 
     xlab="Sample",main="Residual Variance"); 
abline(h=fmBAL$varE,col=4,lwd=2); 
abline(v=fmBAL$burnIn/fm$thin,col=4) 