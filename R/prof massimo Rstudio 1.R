#matrici 
x<-c(10,20,60,80,90,100)
y<-c(15,25,65,85,95,100)
voti_x_y <-c(x,y)
voti_A_B <-matrix(voti_x_y, byrow = FALSE,nrow = 6)
voti_A_B
#vogliamo sapere la dimensione della matrice prima il umero delle righe n delle collone 
dim(voti_A_B)
#coversione operazione arimentica espressa 30esemi 
voti_A_B_def<- voti_A_B * 30 / 100
voti_A_B_def
media<-colSums(voti_A_B_def) /6
media
#nuova matrice 
voti_A_B_tot<-rbind(voti_A_B_def, media) #rbind aggiungere
voti_A_B_tot
#VOGLIAMO selezionare la matrice a e b vogliamo selezionare tutti i voti dello studente A
voti_A_B_tot[1:6,1] # 1 sarebbe il voto di A
voti_A_B_tot[1:6,2] # 2 sarebbe il voto di B 
# matrice estrai della matrici della terza collonna [3,] sei tu che devi specificare 
voti_A_B_tot[3, ] # 3,  SAREBBE VUOTO indica i tutti i campi 
#selezionato tutto della prima colonna perche ce lo spazio vuoto
voti_A_B_tot[,1]

