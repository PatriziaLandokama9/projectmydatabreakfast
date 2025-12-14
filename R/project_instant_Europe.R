library(tibble)

iva <- tibble(
  Country = c("Austria","Belgio","Bulgaria","Croazia","Cipro","Repubblica Ceca",
              "Danimarca","Estonia","Finlandia","Francia","Germania","Grecia",
              "Ungheria","Irlanda","Italia","Lettonia","Lituania","Lussemburgo",
              "Malta","Paesi Bassi","Polonia","Portogallo","Romania","Slovacchia",
              "Slovenia","Spagna","Svezia"),
  Standard_rate = c(20,21,20,25,19,21,
                    25,24,25.5,20,19,24,
                    27,23,22,21,21,17,
                    18,21,23,23,21,23,
                    22,21,25),
  Update_date = c("01.07.2025","29.07.2025","01.07.2025","01.07.2025","01.07.2025","01.07.2025",
                  "01.07.2025","01.07.2025","01.07.2025","01.07.2025","01.07.2025","01.01.2025",
                  "01.07.2025","01.07.2025","01.07.2025","01.07.2025","01.07.2025","01.07.2025",
                  "01.07.2025","01.07.2025","01.07.2025","01.07.2025","01.08.2025","01.07.2025",
                  "01.07.2025","01.07.2025","01.07.2025")
)

iva

head(iva)
# prime 10 righe  
head(iva, 10)
# volevo vedere il dato 
str(iva)
# statistica generale nella tabella come pyhton describe()
summary(iva) 

# mediana  R si fa median(nome_dataframe$nome_collona)
median(iva$Standard_rate)
# mean 
mean(iva$Standard_rate)
# moda 
Mode(iva$Standard_rate)
#min- max
min(iva$Standard_rate)
max(iva$Standard_rate)

# Funzione per la moda
Mode <- function(x){
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}


# Calcola la moda della colonna Standard_rate
Mode(iva$Standard_rate)
#Per i tuoi dati IVA europei, la moda (il valore più frequente) sarà 21%

library(dplyr)

# FILTRARE 
#iva minore del 
iva %>% filter(Standard_rate > 22)

iva %>% filter(Standard_rate >= 22)
# mi fa vedere che ci sono iva piu alte in europa filandia e ungheria del 27%
iva %>% filter(Standard_rate == 23) 

iva %>% filter(Standard_rate <= 22)

iva %>% filter(Standard_rate < 22)

#FILTRARE STRINGA 
#paese singolo 
iva %>% filter(Country == "Francia")
# con piu paesi due possibilita

# confronto 
iva %>% filter(Country == "Francia" | Country == "Belgio")
iva %>% filter(Country == "Estonia"| Country == "Grecia"| Country=="Italia"| Country== "Slovacchia" )
iva %>% filter(Country== "Lussemburgo"|Country=="Irlanda")
iva %>% filter(Country== "Finlandia"|Country=="Svezia"| Country=="Danimarca")
iva %>% filter(Country== "Malta"|Country=="Portogallo")

iva %>%
  filter(Country %in% c("Malta", "Portogallo")) %>%
  select(Country, Standard_rate)

iva %>%
  filter(Standard_rate >= 22) %>%
  arrange(desc(Standard_rate))  # ordina dal più alto al più basso

iva %>%
  filter(Standard_rate <= 22) %>%
  arrange(desc(Standard_rate))  # ordina dal più alto al più basso

barplot(iva$ Standard_rate, main = " Standard_rate_eu", col="blue")
#barplot(iva$ Standard_rate, $Country, main = " Standard_rate_eu", col="blue")
 
pie(iva$Standard_rate)
#istogramma
hist(iva$Standard_rate, col='blue')

plot(iva$Standard_rate,col= 'blue', type = "o")
plot(iva$Standard_rate,col= 'blue', type = "b")
hist(iva$Standard_rate, col = "darkblue", horiz = TRUE)
hist(iva$Standard_rate, col = "lightblue", horiz = FALSE)
barplot(iva$Standard_rate, col = "skyblue")
pie(x, labels = iva$Country)
pie(x, labels = iva$Country, labels= iva$Standard_rate)
# boxplot
boxplot(iva$Standard_rate, main='Standard_rate Eu' , col='blue')

labels <- paste(iva$Country, iva$Standard_rate, "%", sep=": ")
pie(x, labels = labels, col=rainbow(length(x)), main="Aliquote IVA Europee")


barplot(iva$Standard_rate, names.arg = iva$Country, las=2, col="darkblue",
        main="Aliquote IVA per Paese", ylab="Aliquota (%)")

hist(iva$Standard_rate, col="darkblue", main="Distribuzione Aliquote IVA",
     xlab="Aliquota (%)")

############################################### TORIA 
pie(iva$Standard_rate, labels = iva$Country)
# Solo Paesi come etichette otrta 
pie(iva$Standard_rate, labels = iva$Country, main="Aliquote IVA Europee", col=rainbow(length(iva$Country)))
# Oppure solo numeri (aliquote)
pie(iva$Standard_rate, labels = iva$Standard_rate, main="Aliquote IVA Europee", col=rainbow(length(iva$Standard_rate)))

########################################### SCATER PLOT 
# Scater plot grafico linee con palline
plot(x, x, col="darkblue", pch=19, main="Scatter plot Aliquote IVA", xlab="EUROPA (IVA)", ylab="Aliquota (%)")

plot(x, type="b", col="darkblue", pch=16, main="Trend Aliquote IVA",
     xlab="EUROPA (Eu)", ylab="Aliquota (%)")


######################################  GGPLOT FUNZIONE VIOLINO 
library(ggplot2)

ggplot(iva, aes(x = "", y = Standard_rate)) +
  geom_violin()

ggplot(iva, aes(x = "", y = Standard_rate)) +
  geom_violin(fill = "lightblue")

ggplot(iva, aes(x = "", y = Standard_rate)) +
  geom_violin(fill = "lightblue", trim = FALSE)

ggplot(iva, aes(x = "", y = Standard_rate)) +
  geom_violin(fill = "lightblue", width = 1)

ggplot(iva, aes(x = "", y = Standard_rate)) +
  geom_violin(fill = "darkblue", trim = FALSE) +
  geom_jitter(width = 0.1, color = "lightblue")

#####################################GRAFICI BARRE  ORR

barplot(x, names.arg = iva$Country, las=2, col="skyblue", main="Aliquote IVA per Paese", ylab="Aliquota (%)")

x <- iva$Standard_rate
barplot(x, names.arg = iva$Country, las=2, col="skyblue",
        main="Aliquote IVA per Paese", ylab="Aliquota (%)")

x <- iva$Standard_rate
barplot(x, names.arg = iva$Country, horiz=TRUE, col="skyblue",
        main="Aliquote IVA per Paese", xlab="Aliquota (%)")




#############################BARRE VERTICALE 

ggplot(iva, aes(Country, Standard_rate)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  ggtitle("Aliquote IVA standard in Europa")

# ordina il dato dal piu piccolo dal piu grande 
ggplot(iva, aes(Country, Standard_rate)) +
  geom_col(fill = "darkblue") +
  coord_flip() +
  ggtitle("Aliquote IVA standard in Europa")


#ordina i dati dal piu grande dal piu picollo

ggplot(iva %>% 
         mutate(Country = reorder(Country, Standard_rate)), 
       aes(Country, Standard_rate)) +
  geom_col(fill = "darkblue") +
  coord_flip() +
  ggtitle("Aliquote IVA standard in Europa")



##################3 GRAFICI BARRE RAGGRUPAMENTI 
library(ggplot2)

iva %>%
  filter(Standard_rate >= 25) %>%
  ggplot(aes(x = Country, y = Standard_rate)) +
  geom_col(fill= "darkblue")

# contrare la frequenza 
iva %>%
  filter(Standard_rate >= 22) %>%
  summarise(Count = n())


ggplot(iva, aes(x = Country, y = Standard_rate)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Aliquote IVA standard in Europa",
    x = "Paese",
    y = "Aliquota (%)"
  )

ggplot(iva, aes(x = "", y = Standard_rate)) +
  geom_boxplot(fill = "steelblue") +
  geom_jitter(width = 0.2, color = "darkblue") +
  labs(title = "Distribuzione aliquote IVA europee",
       x = "",
       y = "Aliquota (%)")


ggplot(iva, aes(x = "Aliquote", y = Standard_rate)) +
  geom_boxplot(fill = "skyblue") +
  geom_jitter(width = 0.2, color = "darkblue") +
  labs(
    title = "Distribuzione delle aliquote IVA standard in Europa",
    x = "",
    y = "Aliquota (%)"
  )




library(ggplot2)
library(dplyr)

iva %>% 
  arrange(desc(Standard_rate)) %>% 
  ggplot(aes(x = reorder(Country, Standard_rate), y = Standard_rate)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Aliquote IVA standard in Europa (ordinate)",
       x = "Paese", y = "Aliquota (%)")



ggplot(iva, aes(x = "", y = Standard_rate)) +
  geom_violin(fill = "lightblue") +
  geom_boxplot(width = 0.1) +
  labs(title = "Distribuzione aliquote IVA standard in Europa",
       y = "Aliquota (%)") +
  theme_minimal()




library(ggplot2)

ggplot(iva, aes(x = "", y = Standard_rate)) +
  geom_violin(fill = "blue", color = "darkblue") +
  geom_boxplot(width = 0.1, fill = "yellow", color = "black") +
  labs(title = "Distribuzione aliquote IVA standard in Europa",
       y = "Aliquota (%)") +
  theme_minimal()

