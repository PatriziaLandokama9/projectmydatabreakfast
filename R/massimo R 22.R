voti_studente_A<-c(18,25,27,30,23,28)
voti_studente_B<-c(20,26,24,30,22,29) 
esame<-c("esame 1","esame 2","esame 3","esame 4","esame 5","esame 6")
names(voti_studente_A) <-esame
names(voti_studente_B) <-esame

voti_studente_A
voti_studente_B
somma_A <-sum(voti_studente_A)
media_A <-mean(voti_studente_A)
mediana_A <-median(voti_studente_A)
minimo_A <-min(voti_studente_A)
massimo_A <-max(voti_studente_A)

somma_A
media_A
mediana_A
minimo_A
massimo_A

#fare esercizio B 
somma_B <-sum(voti_studente_B)
media_B <-mean(voti_studente_B)
mediana_B <-median(voti_studente_B)
minimo_B <-min(voti_studente_B)
massimo_B <-max(voti_studente_B)

somma_B
media_B
mediana_B
minimo_B
massimo_B


#crea un variabilme 
voti_A_B <-voti_studente_A - voti_studente_B

voti_A_B
#selezionare all'inerno del vettore []
voti_A_B[3]
#selezionare dal piu un elemento da terzo al quinto 
voti_A_B[c(3,5)]
# se noi vogliamo selezionare da un al elemento ad altro range 
voti_A_B[c(3:6)]
# se noi selezioniamo i dati in base delle condizioni maggiori minore 
confronto<- voti_A_B<0
confronto
voti_A_B[confronto]
#cancellare i vettori (rm)
rm(confronto)
confronto 


#matrici 
