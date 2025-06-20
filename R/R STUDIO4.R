#DATAFRAME COLLONA RIGHE SQREBBE LA COSTRUZIONE DELLA TABELLA 
anno <- c(2010,2011,2012,2013,2014,2015,2016)
num_impigeati <-c(265,277,281,300,400,450,500)
num_impigeati_m <-c(165,200,201,150,200,300,250)
num_impigeati_f <-c(100,77,80,150,200,150,250)
impiegati <-data.frame(anno, num_impigeati,num_impigeati_f,num_impigeati_m)
impiegati
# grafici $ scegli 
barplot(impiegati$num_impigeati_f)
#titolo del grafico mean
barplot(impiegati$num_impigeati_f, main = "impiegati donne")
# aggiungere il colore
barplot(impiegati$num_impigeati_f, main = "impiegati donne", col="red")
#TITOLO ASSE DA MODIFICARE RENDERLO LEGGIBILE
mioplot <-barplot(impiegati$num_impigeati_f, main = "impiegati donne", col="red", ylab = "n impiegati femmine")

#boxplot
boxplot(impiegati$num_impigeati_m, main="impiegati maschi")
#piu serie confronto di due variabile 
boxplot(impiegati$num_impigeati_m, impiegati$num_impigeati_f)
#VERTICALE
boxplot(impiegati$num_impigeati_m, impiegati$num_impigeati_f, names =c("maschi","femmine"),col=c("blue","red"))
#colore nomi collone ORIZON
boxplot(impiegati$num_impigeati_m, impiegati$num_impigeati_f, names =c("maschi","femmine"),col=c("blue","red"),horizontal =TRUE)
#grafico torta
pie(impiegati$num_impigeati)
#3lezioni prof massimo 
