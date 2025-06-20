#DATAFRAME COLLONA RIGHE SQREBBE LA COSTRUZIONE DELLA TABELLA 
anno <- c(2010,2011,2012,2013,2014,2015,2016)
num_impigeati <-c(265,277,281,300,400,450,500)
num_impigeati_m <-c(165,200,201,150,200,300,250)
num_impigeati_f <-c(100,77,80,150,200,150,250)
impiegati <-data.frame(anno, num_impigeati,num_impigeati_f,num_impigeati_m)
impiegati
head(impiegati) # ti seleziona solo le prime sei righe
tail(impiegati)# ti fa vedere ultimo a sei righe 
dim(impiegati) # ti 
nrow(impiegati)
ncol(impiegati)
str(impiegati) # str  sarebbe strutturato dataframe 

#creare un altro data frame aggiungere gli stipendi
stipendi_totali <- c(1000,1200,1450,1500,1650,1700,1800)
#FUNZIONE CHE PRENDE DATA FRAME PIU NOUVA MATRICE DELLO STIPENDI
impiegati_var <- cbind(impiegati,stipendi_totali)#cbind agg una nuova collonna
impiegati_var
#visualizziamo dei nomi data frame nomi delle collone matrice
names(impiegati_var)
names(impiegati_var) <-c("year","emp","emp_f", "emp_m","salary_tot")
impiegati_var
#visualizzare i dati dei impiegati della colonna visualizza te li mettere per in riga 
impiegati_var$emp
#simbolo dataframe$chiave 
#se voglio fare modificare stipendio  
impiegati_var$salary_tot <- impiegati_var$salary_tot+10
impiegati_var
#fare la media 
mean(impiegati_var$emp)
#fare la mediana
median(impiegati_var$emp)
#min 
min(impiegati_var$emp)
#max
max(impiegati_var)

#selezionare data frame stipendi >1400 MAGGIORE
subset(impiegati_var, salary_tot>1400)
subset(impiegati_var, salary_tot<1400)
subset(impiegati_var, salary_tot==1510)
subset(impiegati_var, salary_tot>=1510)
subset(impiegati_var, salary_tot<=1510)
#confronto piu colonne &
subset(impiegati_var, emp_f >=150 & emp_m >=300)
subset(impiegati_var, emp_f>=150 & emp_m >=150)

# prendi i dati 5 colonne o 6 righe 
anno <- c(2012,2013,2014,2015,2016,2017,2018)
num_studenti  <-c(20,30,40,50,100,60,500)
num_studenti_m <-c(10,15,20,25,50,30,250)
num_studenti_f <-c(10,15,20,25,50,30,250)
studenti <-data.frame(anno, num_studenti,num_studenti_f,num_studenti_m)
studenti
#COMANDO HEAD  selezionati i primi valori TAIL ultimi valori 
head(studenti)
tail(studenti)
#funzione dim [dimensione per vedere data frame]
dim(studenti)
#nrow ncol
nrow(studenti)
#ncol
ncol(studenti)
# vedere la struttura completa nome str che tipo di dato e sono tutti numerici tipo di dato del campo 
str(studenti)

#aggiungere un datoframe una collana 
#supponiamo che vogliamo fare la collona degli  tassa universitria 
tassa_uni <-c(4000, 5000, 7500, 8500, 10000, 6000, 7500) 
studenti_def <-cbind(studenti, tassa_uni)
studenti_def
#vedere nomi del dataframe 
names(studenti_def)
#cambiare i nomi  names
names(studenti_def)<-c("year","emp", "emp_f", "emp_m", "tax" )
studenti_def
#visualizzare dei dati singoli dati una collona specifica 
studenti_def$emp
studenti_def$emp_f
studenti_def$year
studenti_def$emp_m
studenti_def$tax
#calcolo aumentare la tassa universitaria 
#operazione aritmetica R
studenti_def$tax<-studenti_def$tax+1000 
studenti_def



#media data frame tabella aggiunta
mean(studenti_def$tax)
median(studenti_def$tax)
min(studenti_def$tax)
max(studenti_def$tax)
#selezionare alcuni cose righe dataframe maggiore di 8 mila 
#MINORE == 
subset(studenti_def, tax>8000) 
subset(studenti_def, tax==7000)
#lavorazione dei file
#vai session vai set working dicrection vai su choose direct su excel 
crei un tabella e poi vai file esportazione lo salvi su download ti crei una cartella 
#importare i file cvs excel
bfast <-read.csv("Cartel1.csv", header = TRUE, sep=",")
bfast
#comandi (pincipale nome file corretto.csv, header=TRUE, sep=",") sep ""sceglitu come moficare
#da li puoi fare le cose con i dataframe
#la rimane  4 lezione yes 


