-- LEZIONE PATTI SCHEMA
----------------------------------------------1 SELECT FROM 
---------------SELEZIONARE TAB 1 e SELEZIONARE TAB2--------------------------------------------
--TAB1 STUDENTE TAB2 ESAMI
SELECT nomeCLONN1, NOMECOLL2 FROM TAB1;
SELECT nomeCLONN1, NOMECOLL2 FROM TAB2;
SELECT nome, cognome FROM studente; --  select= selezionare il nome della colonna interagozione from  tabella studenetnte
SELECT matricola, nome, cognome FROM studente; -- selezionato tutti nome delle colone 
SELECT * FROM studente; -- selezioni tutti metodo piu veloce * asterisco io chiamo stella cosi eviti di scrivere a mano 
select * from esame; -- ti fa vedere tutte le tabelle esame 

SQL: SELECT e FROM
SELECT → serve per selezionare quali colonne vuoi vedere.
FROM → indica da quale tabella vuoi prendere i dati.
* → seleziona tutte le colonne della tabella (veloce e comodo).

Esempi:
SELECT nomeCOLONNA1, nomeCOLONNA2 FROM TAB1;
-- Seleziona solo le colonne specificate dalla tabella TAB1
SELECT nome, cognome FROM studente;
-- Seleziona nome e cognome dalla tabella studente
SELECT matricola, nome, cognome FROM studente;
-- Seleziona matricola, nome e cognome dalla tabella studente
SELECT * FROM studente;
-- Seleziona tutte le colonne dalla tabella studente
SELECT * FROM esame;
-- Seleziona tutte le colonne dalla tabella esame



--------- per evitare di vedere i duplicati  SELECT DISTINCT 
SELECT DISTINCT NOMCOLON FROM TAB1;
SELECT DISTINCT NOMCOLON FROM TAB2;
SELECT DISTINCT materia FROM esame; --materia nome colonna  esame tabella 

-- alias Alias = abbreviazione o soprannome temporaneo AS 
SELECT materia AS nomemateria FROM esame; 
SELECT materia FROM esame as e; --e sarebbe esame abbreviato dopo from 

1. SELECT DISTINCT – Evitare i duplicati
🔍 Quando usarlo?
Quando vuoi vedere solo valori unici (senza ripetizioni) da una colonna.

✅ Esempio:
SELECT DISTINCT materia FROM esame;
Questo ti mostra una sola volta ogni materia, anche se è ripetuta più volte nella tabella esame.

2. AS – Alias per colonne o tabelle
🧠 A cosa serve?
Per dare un nome temporaneo (più leggibile o più corto) a una colonna o a una tabella.

✅ Alias per colonna:
SELECT materia AS nomemateria FROM esame;
Ora la colonna si chiamerà "nomemateria" nell’output.

✅ Alias per tabella:
SELECT materia FROM esame AS e;
Puoi usare e come abbreviazione della tabella esame.

Puoi anche scriverlo senza AS, ma è più chiaro con:
SELECT e.materia FROM esame AS e;

🧠 Schema Riassuntivo
| Cosa              | Sintassi                        | A cosa serve                   |
| ----------------- | ------------------------------- | ------------------------------ |
| Evitare duplicati | `SELECT DISTINCT colonna`       | Mostra solo valori unici       |
| Alias per colonna | `colonna AS nuovo_nome`         | Cambia nome visualizzato       |
| Alias per tabella | `FROM tabella AS abbreviazione` | Abbrevia il nome della tabella |

--------------------------------UNICA COLONNA -------------------------------------------------
-- conchecazione io voglio nome e cognome siano unica colonna +
SELECT nomeCOLONNA + Nnomecolonn  as nomecompleto FROM TAB1;
SELECT nomeCOLONNA + Nnomecolonn  as nomecompleto FROM TAB2;
SELECT nome + cognome  as nomecompleto FROM studente;
SELECT nomeCOLL1 +' ' + nomeCOLL2  as nomecompleto FROM TAB1;
SELECT nomeCOLL1 +' ' + nomeCOLL2  as nomecompleto FROM TAB2;
SELECT nome +' '+ cognome  as nomecompleto FROM studente;
SELECT nome +' '+ cognome  as nomecompleto FROM studente;-- se vuoi con lo spazio +' '+

✅ Sintassi di concatenazione in SQL (con AS per dare un nome alla nuova colonna)
📌 Per SQL Server:
SELECT nome + ' ' + cognome AS nomecompleto
FROM studente;

📌 Per MySQL o PostgreSQL:
SELECT CONCAT(nome, ' ', cognome) AS nomecompleto
FROM studente;

✅ Esempi pratici
-- Unire nome e cognome senza spazio
SELECT nome + cognome AS nomecompleto FROM studente;
-- Unire nome e cognome con uno spazio tra loro (SQL Server)
SELECT nome + ' ' + cognome AS nomecompleto FROM studente;
-- In MySQL o PostgreSQL
SELECT CONCAT(nome, ' ', cognome) AS nomecompleto FROM studente;

⚠️ Attenzione
In SQL Server usi + per concatenare stringhe.
In MySQL/PostgreSQL usi CONCAT().

🧠 Bonus – Con 3 colonne:
SELECT CONCAT(nome, ' ', cognome, ' - ', indirizzo) AS dati_completi
FROM studente;

----------------------------FILTRARE WHERE -----------------------------------------------------
✅ FILTRARE I DATI CON WHERE
📌 Esempi corretti:
-- Studenti con nome "giacomo"
SELECT * FROM studente WHERE nome = 'giacomo';

-- Studente con matricola 1000 (dato numerico)
SELECT * FROM studente WHERE matricola = 1000;
-- Esami della materia "algoritmi"
SELECT * FROM esame WHERE materia = 'algoritmi';
-- Esami con voto esattamente 30
SELECT * FROM esame WHERE voto = 30;
-- Esami con voto maggiore di 25 (quindi da 26 in su)
SELECT * FROM esame WHERE voto > 25;
-- Esami con voto maggiore o uguale a 25
SELECT * FROM esame WHERE voto >= 25;
-- Esami con voto minore di 25 (quindi fino a 24)
SELECT * FROM esame WHERE voto < 25;
-- Esami con voto minore o uguale a 25
SELECT * FROM esame WHERE voto <= 25;
-- Esami con voto diverso da 25
SELECT * FROM esame WHERE voto <> 25;  -- oppure:
SELECT * FROM esame WHERE voto != 25;

⚠️ Errori da evitare:
-- ERRATO: simbolo `=<` NON esiste
SELECT * FROM esame WHERE voto =< 25; ❌
-- ERRATO: `!<` o `!>` NON sono operatori SQL validi
SELECT * FROM esame WHERE voto !< 25; ❌
SELECT * FROM esame WHERE voto !> 25; ❌
✅ Corretto: usa solo =, <, >, <=, >=, <> o !=

🧠 Mini Riepilogo Operatori di Confronto:
| Operatore   | Significato       |
| ----------- | ----------------- |
| `=`         | Uguale a          |
| `>`         | Maggiore di       |
| `<`         | Minore di         |
| `>=`        | Maggiore o uguale |
| `<=`        | Minore o uguale   |
| `<>` o `!=` | Diverso da        |


--FILTRARE i dati WHERE se io voglio solo i tutti studenti con il nome giacomo 
SELECT * FROM TAB1 WHERE nomeCOLONNA='VALORI';
SELECT * FROM TAB2 WHERE nomeCOLONNA='VALORI';
SELECT * FROM studente WHERE nome='giacomo';
SELECT * FROM studente WHERE matricola='1000'--se voglio filtrare con il dato numerico
SELECT * FROM esame WHERE materia='algoritmi';
SELECT * FROM esame WHERE voto=30; --OPERATORE DI CONFRONTO = > MAGG < MIN >= MAGG= <=MIN =
SELECT * FROM esame WHERE voto>25; -- studenti con maggiore voto di 25 attezione parte da 26 NO 25 
SELECT * FROM esame WHERE voto>=25;-- I STUDENTI CHE PARTANO 25 IN SU comprende il 25
SELECT * FROM esame WHERE voto<25;-- STUDENTI con minore 25 ATTEZIONE parte da 24 NO 25 
SELECT * FROM esame WHERE voto=<25; -- I STUDENTI CHE PARTONO 25 IN GIU quindi il 25 e compreso 
SELECT * FROM esame WHERE voto<>25;-- diverso vuol dire ti fa vedere i tutti valori tranne 25
SELECT * FROM esame WHERE voto!=25;-- diverso ma sto neganso 25 quindi non te lo considera
SELECT * FROM esame WHERE voto!<25;-- dammi i tutti i voti che non sono minori da 25
SELECT * FROM esame WHERE voto!>25;-- dammi i tutti voti che non sono maggiori di 25

-------------------------------------------------- ORDINE QUERY 
✅ ORDINE QUERY NEGATIVO 
-- ORDINE QUERY SQL NEGATIVO
SELECT colonna1, colonna2        -- 1. Cosa vuoi vedere (le colonne da mostrare)
FROM nome_tabella                -- 2. Da dove (il nome della tabella)
WHERE NOT condizione             -- 3. Quali righe (condizione negata, se serve)
ORDER BY colonna ASC|DESC;       -- 4. (Facoltativo) Come ordinare i risultati

✅ OPERAZIONI LOGICHE IN SQL
🧠 Ordine di precedenza naturale:
NOT
AND
OR
👉 Senza parentesi, SQL rispetta questo ordine.
Per forzare un diverso ordine logico, usa le parentesi ().

🎯 Esempio con parantesi:
SELECT *
FROM esame
WHERE NOT (materia = 'algoritmi' OR materia = 'matematica')
  AND (voto = 30 OR voto = 28);

✅ Questo significa:
Esclude algoritmi o matematica
Ma solo se il voto è 28 o 30

🚫 Esempio senza parentesi (errore comune):
SELECT *
FROM esame
WHERE materia = 'algoritmi' OR materia = 'matematica' -- non metti la parentesi 
  AND voto = 30 OR voto = 28;

⚠️ Qui SQL fa:
materia = 'matematica' AND voto = 30 → valutato prima
Poi valuta gli OR
Risultato: non quello che volevi!

🧩 Operatori logici spiegati:
| Operatore | Significato | Funziona se...                                  |
| --------- | ----------- | ----------------------------------------------- |
| `AND`     | E           | Entrambe le condizioni sono vere                |
| `OR`      | O           | Almeno una condizione è vera                    |
| `NOT`     | Negazione   | Inverte il risultato (vero → falso e viceversa) |

🧠 Frase per ricordare:
Prima nega, poi controlla tutto (AND), alla fine scegli (OR)



SELECT * FROM esame WHERE  NOT voto<25;-- STO CHIEDENDO I VOTI NON MINORI 25 NEGAZIONE maggiore o uguale 
SELECT * FROM esame WHERE  NOT voto!<25;-- vediamo i dati che non sono minore di 25

-- AND  aggiunge piu condizioni combina con due espressioni 
SELECT * FROM esame WHERE  voto!<25 and materia='fisica';-- mi da i voti che sono minori di 25 e con materia solo fisca 

--OR sarebbe che voglio solo la colonna solo elenco particolari ma non tutti
SELECT * FROM esame WHERE  materia='algoritmi' or materia='fisica';--stessa collonna ma voglio vere due specifiche valori no tutte le colonne

-- AND OR in caso voglio avere piu condizioni 
SELECT * FROM esame WHERE (voto=30 and  materia='matematica') OR (voto=30 and  materia='sistemi operativi');--mi da come tabella i sistemi operativi e matematica con i voti 30
SELECT * FROM esame WHERE (materia='algoritmi' OR  materia='matematica') AND (voto=30 OR  voto= 28);-- mi da le due materie come matematica algoritmi   con i voti 28 a 30
SELECT * FROM esame WHERE NOT (materia='algoritmi' OR  materia='matematica') AND (voto=30 OR  voto= 28);--not sono state negate le materie come algoritmi matematica

--() le parentesi servono dare un ordine di priorita 
SELECT * FROM esame WHERE NOT (materia='algoritmi' OR  materia='matematica') AND (voto=30 OR  voto= 28);-- le parentesi e fondamentale perche se tu vorresti dare delle priorita  senza parentesi ti mette tutto 
SELECT * FROM esame WHERE  materia='algoritmi' OR  materia='matematica' AND voto=30 OR  voto= 28;-- senza parentesi ti da la priorita AND materia= matematica AND voto=30 e poi ve,gono considerate le OR voto=28 materia='algoritmi'
-- AND= DUE CONDIZIONI SONO VERE OR= UNA CONDIZIONE VERA NOT NEGA RISULTATO ESPRESIONE 


-------------------------------BETWEEN  sarebbe un range 
✅ BETWEEN / NOT BETWEEN – Uso in SQL
📌 Sintassi base:
SELECT colonne
FROM tabella
WHERE colonna BETWEEN valore_minimo AND valore_massimo;

🔢 Esempio con numeri (intervallo chiuso):
SELECT * 
FROM esame 
WHERE voto BETWEEN 25 AND 30;
✔️ Seleziona tutti gli esami con voto da 25 a 30 compresi

🔤 Esempio con testi (ordine alfabetico):
SELECT * 
FROM esame 
WHERE materia BETWEEN 'algoritmi' AND 'fisica';
✔️ Prende tutte le materie dalla A a F, cioè alfabeticamente da algoritmi a fisica


--SELECT  collone FROM tabella WHERE colonna BETWEEN valoreminimo AND valoremax
SELECT * FROM esame WHERE voto BETWEEN 25 AND 30;-- sono stati presi i voti con i valori tra 25 a 30 fanno parte dei dati 
SELECT * FROM esame WHERE materia BETWEEN 'algoritmi' AND 'fisica';-- in caso se ci sono informazioni (parole no numeriche )va in ordine alfabetico A-F perche parte algoritimo fino fisica 
SELECT * FROM esame WHERE materia NOT BETWEEN 'algoritmi' AND 'fisica';-- non comprende delle info agolritmi a fisica  che non sono comprese nel range algoritmi a fisica 

🧠 Schema rapido da ricordare:
BETWEEN: compreso tra
NOT BETWEEN: escluso tra
Funziona con: numeri, date, stringhe
Intervallo inclusivo: prende anche gli estremi

-----------------------------------------IN
✅ Uso dell’operatore IN e NOT IN in SQL
📌 IN → Seleziona solo i valori specificati
SELECT * 
FROM esame 
WHERE voto IN (24, 28, 30);
✔️ Restituisce solo le righe dove il voto è 24, 28 o 30

📌 NOT IN → Esclude i valori specificati
SELECT * 
FROM esame 
WHERE materia NOT IN ('fisica', 'algoritmi');
❌ Esclude le righe con materia fisica o algoritmi

-- IN CI PERMETTE determinato valore specifico uno dei due valuta solo i dati della stessa colonna  NIN SOLO UNA COLONNA invece OR + COLONNE 
SELECT * FROM esame WHERE voto IN (24,30);-- mi da 24 o 28 solo questi qua due 24, 28
SELECT * FROM esame WHERE voto IN (24,28,29,30,18);-- restituite che hanno solo questi valori 
SELECT * FROM esame WHERE voto IN ('fisica','algoritmi');-- restituite che hanno solo questi valori
SELECT * FROM esame WHERE voto IN ('fisica','algoritmi','matematica');-- restituite che hanno solo questi valori
SELECT * FROM esame WHERE voto NOT  IN ('fisica','algoritmi');-- NON TI DA come materie e fisica  algoritmi

✅ Differenza tra IN e OR
| **IN**                          | **OR**                                    |
| ------------------------------- | ----------------------------------------- |
| Si usa con **una sola colonna** | Può confrontare anche **colonne diverse** |
| Sintassi più breve              | Sintassi più lunga                        |
🔍 Esempio equivalente con OR:
-- con IN:
WHERE materia IN ('fisica', 'matematica')

-- con OR:
WHERE materia = 'fisica' OR materia = 'matematica'
⚠️ Attenzione
IN e NOT IN funzionano solo con valori nella stessa colonna.
-------------------------------------------------LIKE 
✅ 1. Pattern specifico esatto 
SELECT * FROM esame WHERE materia LIKE 'algoritmi';
➡️ Mostra solo le righe dove materia è esattamente "algoritmi"

✅ 2. % = Qualsiasi sequenza di caratteri anche nessuno
| Esempio  | Significato                                             |
| -------- | ------------------------------------------------------- |
| `'al%'`  | Inizia con "al" (es. "algoritmi", "algebra")            |
| `'%e'`   | Finisce con "e" (es. "fisiche", "matematicae")          |
| `'%ma%'` | Contiene "ma" ovunque (es. "matematica", "informatica") |
| `'% %'`  | Contiene uno **spazio** (es. "analisi matematica")      |

SELECT * FROM esame WHERE materia LIKE 'al%';
SELECT * FROM esame WHERE materia LIKE '%ma%';
SELECT * FROM esame WHERE materia LIKE '% %';

✅ 3. _ = Un singolo carattere esatto
| Esempio    | Significato                                                |
| ---------- | ---------------------------------------------------------- |
| `'f_____'` | Comincia con "f" e ha esattamente 6 lettere (es. "fisica") |
| `'_i____'` | Il secondo carattere è "i" (es. "fisica", "chimica")       |
SELECT * FROM esame WHERE materia LIKE 'f_____';
SELECT * FROM esame WHERE materia LIKE '_i____';

📌 Suggerimenti utili:
% = tanti caratteri
_ = un solo carattere
'a%' ≠ '%a' (ordine importante)
LIKE non fa distinzione tra maiuscole/minuscole in MySQL ma sì in altri DBMS (es. PostgreSQL)



-- ci sono tre modi per indentificare che puoi usare 
--1 specifico pattern -- ti fa vedere solo quello che tu richiedi like uso come uguale 
SELECT * FROM esame WHERE materia LIKE 'algoritmi'; --VEGONO RESTITUITE TUTTE CON materie algoritmi  
--2 %zero, uno o piu caratteri 
SELECT * FROM esame WHERE materia LIKE 'al%';-- importente che materia inizia con al intendo che vorrei che iniziasse al nome colonna dopo% 
SELECT * FROM esame WHERE materia LIKE 'a%';-- importente che materia inizia con a intendo che vorrei che iniziasse a nome colonna dopo% 
SELECT * FROM esame WHERE materia LIKE '%e';--materie che terminano con e  fine delle parole prima%
SELECT * FROM esame WHERE materia LIKE '%ca';--materie che terminano con ca  fine delle parole prima%
SELECT * FROM esame WHERE materia LIKE '%ma%';-- materie  interno della stringa che mi diano con ma %inizio%fine
SELECT * FROM esame WHERE materia LIKE '%  %';-- se io voglio cercare i nomi con lo spazio delle stringe 
--_ singolo carattere 
SELECT * FROM esame WHERE materia LIKE 'f_____'; -- underscore f_____ ho fatto 4 undescor perche sare fisica  che ha quattro caratteri mi esce fisica 
SELECT * FROM esame WHERE materia LIKE 'f_____%'--
SELECT * FROM esame WHERE materia LIKE '_i____'-- ti fa vedere materie secondo carattere

--order by vedere in ordine alfabetico
     --POSITIVO     ||--NEGATIVO
   SELECT colonna   ||SELECT colonna1, colonna2        -- 1. Cosa vuoi vedere
    FROM colonna    ||FROM nome_tabella                -- 2. Da dove (la tabella)     
    WHERE condizione||WHERE NOT condizione             -- 3. Quali righe (condizione negata)
ORDER BY colonna ASC||ORDER BY colonna ASC|DESC;       -- 4. (Facoltativo) Come ordinare i risultati

SELECT colonna  
FROM tabella
WHERE condizione
ORDER BY colonna ASC; --ordine crescente.
 
SELECT * FROM esame ORDER BY materia;-- ordine a-z
SELECT * FROM esame ORDER BY voto;-- ordine piu piccolo piu grande 
SELECT * FROM esame ORDER BY materia, voto;--piu di colonna inizia con la materia e poi con il voto lo vedete dalla tabella di voto da piu piccolo a piu grane 
SELECT * FROM esame ORDER BY materia, voto, matricola;--piu di colonna inizia con la materia e poi con il voto lo vedete dalla tabella di voto da piu piccolo a piu grane e avro le matricole con ordine decrescente 
SELECT * FROM esame ORDER BY 2;-- ti fa vedere la seconda colonna 
--DESC DECRESCENTE 
SELECT * FROM esame ORDER BY voto DESC;-- PIU GRANDE AL PIU PICCOLO 
--
SELECT * FROM esame WHERE materia like 'a' ORDER BY 2; -- TI FA VEDERE COLONNA 2 INIZIANO CON A
SELECT materia AS nomemateria FROM esame ORDER BY nomemateria;




1. Filtrare con WHERE
Esempio: voglio vedere tutti gli studenti con nome “Marco”.
SELECT * FROM studente WHERE nome = 'Marco';

2. Filtrare con confronto numerico
Esempio: voglio tutti gli esami con voto maggiore o uguale a 28.
SELECT * FROM esame WHERE voto >= 28;

3. Filtrare più condizioni con AND e OR
Esempio: voglio esami con voto 30 oppure materie “matematica”.
SELECT * FROM esame WHERE voto = 30 OR materia = 'matematica';
Esempio: voglio esami con voto 30 e materia “matematica”.
SELECT * FROM esame WHERE voto = 30 AND materia = 'matematica';


--------------------------------- Vincoli INTEGRITA 
--regole applicate alle tabelle per garanire integrita dei dati 
-- valori di una colonna 
--valori assunti da tutte le righe di una tabella 
--valori assunti da colonne di tabella relazionate tra di loro 
--il vincolo puo essere condizione vero e falso sodisfatta o no soddisfatta 
--PRIMARY KEY INDETIFICA unicavamente righe di una tabella o piu righe un altra tabela 
--FOREIGN KEY unicavamente colonne di una tabella o piu colonne un altra tabela 
--UNIQUE garantisce le colonne che non fanno parte ella chiave primaria non abbiano i valori dupplicati 
--CHECK limite valori accetati da una piu colonne 
--  in pratica se tab 1 sarebbe studente interbno delle colonne ci sono nomi e cognomi tab2 esami e voti da li riesci vedere la combinazione delle tabelle 
-- grazie alle relazioni posso vedere in caso dello studente con la matricola sia tab1 E TAB2  posso veere quali esami ha sostenuto e quali chi ha sotenuto 
-- interoggo tutte e due tabelle quelle devo utilizzare join 
--JOIN  sarebbe combinare le righe di due o piu tabelle relazione tra di loro 


-------------------------------------------INNER JOIN
2️⃣ INNER JOIN
Prende solo le righe che hanno corrispondenza in entrambe le tabelle.
SELECT s.nome, e.materia, e.voto
FROM studente AS s
INNER JOIN esame AS e ON s.matricola = e.matricola;

2️⃣ INNER JOIN – Spiegazione

🔍 Cosa fa?
Mostra solo le righe dove ce una corrispondenza tra le due tabelle.
✅ ORDINE SINTASSI SQL – INNER JOIN
SELECT s.nome, e.materia, e.voto     -- 1. Cosa vuoi vedere (colonne)
FROM studente AS s                  -- 2. Da quale tabella (principale)
INNER JOIN esame AS e               -- 3. Unione con la seconda tabella
  ON s.matricola = e.matricola;     -- 4. Condizione di collegamento

  🧠 Frase per ricordare:
INNER JOIN = Mostra SOLO chi ha corrispondenza tra le tabelle



SELECT colonne FROM TAB1 INNER JOIN TAB2 ON TAB1.COL= TAB2.COL;
SELECT * FROM studente INNER JOIN esame ON stuente.matricola= esame.matricola;
--abbreviato 
SELECT *  FROM stdente  as a INNER JOIN esame  as e ON s.matricola= e.matricola;--entrambi delle tabelle 1 e 2 hanno combinazione e relazioni infatti 
-- in qusto caso entrambi tab1 E tab2 hanno la relazione matricola infatti vedo quali sono combinate vediamo con tutte corispondeze te li fa vederedemo
-- se non e corrisposto non te li fa vedere perche esempio degli studenti non hanno sostenuto esami 
-- TI FA VEDERE SOLO QUELLI CORSSIPOSNDONO ENTRABI TABELLE HANNO LO STESSO NOME DELLA COLONNA

🎓 TABELLA studente (SINISTRA)                        📝 TABELLA esame (DESTRA)
		| matricola | nome   |                        | id\_esame | matricola | materia    | voto |
        | --------- | ------ |                        | --------- | --------- | ---------- | ---- |
        | 1         | Marco  |                        | 101       | 1         | Matematica | 28   |
        | 2         | Laura  |                        | 102       | 2         | Storia     | 30   |
        | 3         | Giulia |                        | 103       | 5         | Fisica     | 26   |

🔁 QUERY CON INNER JOIN
SELECT s.nome, e.materia, e.voto
FROM studente AS s
INNER JOIN esame AS e ON s.matricola = e.matricola;

✅ OUTPUT
| nome  | materia    | voto |
| ----- | ---------- | ---- |
| Marco | Matematica | 28   |
| Laura | Storia     | 30   |

📌 MEMORIZZA COSÌ:
INNER JOIN = Solo chi ha corrispondenza

📊 Studente + 📄 Esame → Solo chi ha dati in entrambe le tabelle.





----------------------------------------------LEFT JOIN 



3️⃣ LEFT JOIN
Prende tutte le righe della tabella a sinistra (studente), anche se non hanno corrispondenza nella tabella di destra (esame).
SELECT s.nome, e.materia, e.voto
FROM studente AS s
LEFT JOIN esame AS e ON s.matricola = e.matricola;

--come vediamo tab1 studente SINISTRA  tab2 esame DESTRA 
-- se hanno delle combinazioni
-- se la TAB1 sinistra non soddisfa le combinazione ti viene presentato NULL nella tab2 LA PARTE DESTRA NULL 
--se la TAB1 ha i valori ma non viene presentato nela TAB2 cosa succede  tab1 lo presenta ma destra sara il valore null perche non ce corrispodenza
-- se abbiamo la TAB2 ma non ha corrispodenza TAB1 non viene presentato 
-- ESEMPIO TABELLA STUDENTE SINISTRA TABELLA ESAME DESTRA  SE ENTRAMBI HANNO LA COMBINAZIONE VIENE PRESENTATO 
-- ESEMPIO TABELLA STUDENTE SINISTRA HA DEI VALORI MA NON CORRISPONDOO DELLA TABELLA ESAMI  SUCCEDE TABELLA STUDENTI LI FA PRESENTARE I VALORI MA LA PARTE DESTRA PRESENTA NULL
-- ESEMPIO TABELLA ESAMI  DESTRA  NON HA COMBINAZIONE  CON LA TABELLA STUDENTI COSA SUCCEDE  NON TE LO FA VEDERE OUTPUT 

🎓 TABELLA studente (SINISTRA)                        📝 TABELLA esame (DESTRA)
		| matricola | nome   |                        | id\_esame | matricola | materia    | voto |
        | --------- | ------ |                        | --------- | --------- | ---------- | ---- |
        | 1         | Marco  |                        | 101       | 1         | Matematica | 28   |
        | 2         | Laura  |                        | 102       | 2         | Storia     | 30   |
        | 3         | Giulia |                        | 103       | 5         | Fisica     | 26   |

🔁 QUERY CON LEFT JOIN
SELECT s.nome, e.materia, e.voto
FROM studente AS s
LEFT JOIN esame AS e ON s.matricola = e.matricola;

✅ OUTPUT
| nome   | materia    | voto |
| ------ | ---------- | ---- |
| Marco  | Matematica | 28   |
| Laura  | Storia     | 30   |
| Giulia | NULL       | NULL |
Giulia non ha relazione  con la tebbela destra perche non ha meterie e non ha il voto 

SELECT colonne FROM TAB1 LEFT JOIN TAB2 ON TAB1.COL= TAB2.COL;
SELECT * FROM studente LEFT JOIN esame ON stuente.matricola= esame.matricola;
--abbreviato
SELECT *  FROM stdente  as a LEFT JOIN esame  as e ON s.matricola= e.matricola;

------------------------------------------------RIGHT JOIN 
✅ ORDINE SINTASSI SQL – INNER JOIN

Mostra tutti i record della seconda tabella (destra), anche senza corrispondenza.



️⃣ RIGHT JOIN
Prende tutte le righe della tabella a destra (esame), anche se non hanno corrispondenza nella tabella di sinistra (studente).
SELECT s.nome, e.materia, e.voto
FROM studente AS s
RIGHT JOIN esame AS e ON s.matricola = e.matricola;

--come vediamo tab1 studente SINISTRA      tab2 esame DESTRA 
-- se hanno delle combinazioni
-- se la TAB2 destra non soddisfa le combinazione ti viene presentato NULL nella tab1 LA PARTE SINISTRA NULL 
--se la TAB2 ha i valori ma non viene presentato nella TAB1 cosa succede  tab2 lo presenta ma sinitra  sara il valore null perche non ce corrispodenza
-- se abbiamo la TAB1 ma non ha corrispodenza TAB2 non viene presentato
-- ESEMPIO TABELLA ESAMI DESTRA TABELLA STUENTE SINISTRA  SE ENTRAMBI HANNO LA COMBINAZIONE VIENE PRESENTATO 
-- ESEMPIO TABELLA ESAMI DESTRA HA DEI VALORI MA NON CORRISPONDOO DELLA TABELLA STUDENTI SINISTRA SUCCEDE TABELLA ESAMI LI FA PRESENTARE I VALORI MA LA PARTE SINISTRA PRESENTA NULL
-- ESEMPIO TABELLA STUDENTE SINISTRA  NON HA COMBINAZIONE  CON LA TABELLA ESAMI COSA SUCCEDE  NON TE LO FA VEDERE OUTPUT 
SELECT colonne FROM TAB1 RIGHT JOIN TAB2 ON TAB1.COL= TAB2.COL;
SELECT * FROM studente RIGHT JOIN esame ON stuente.matricola= esame.matricola;
--abbreviato
SELECT *  FROM stdente  as a RIGHT JOIN esame  as e ON s.matricola= e.matricola;

🎓 TABELLA studente (SINISTRA)                        📝 TABELLA esame (DESTRA)
		| matricola | nome   |                        | id\_esame | matricola | materia    | voto |
        | --------- | ------ |                        | --------- | --------- | ---------- | ---- |
        | 1         | Marco  |                        | 101       | 1         | Matematica | 28   |
        | 2         | Laura  |                        | 102       | 2         | Storia     | 30   |
        | 3         | Giulia |                        | 103       | 5         | Fisica     | 26   |
                                                      🔎 Nota: matricola 5 nell esame non esiste nella tabella studente

🔁 QUERY CON RIGHT JOIN

SELECT s.nome, e.matricola, e.materia, e.voto
FROM studente AS s
RIGHT JOIN esame AS e ON s.matricola = e.matricola;

✅ OUTPUT
| nome  | matricola | materia    | voto |
| ----- | --------- | ---------- | ---- |
| Marco | 1         | Matematica | 28   |
| Laura | 2         | Storia     | 30   |
| NULL  | 5         | Fisica     | 26   |
perche fisica ce nella tabella di destra nella parte sinistra non ha corrsispondenza quindi null





----------------------FULL JOIN 
📘 Sintassi generale:                                       ||✅ Esempio pratico:
SELECT colonne                                              ||SELECT *
FROM tabella1                                               ||FROM studente
FULL JOIN tabella2 ON tabella1.colonna = tabella2.colonna;  ||FULL JOIN esame ON studente.matricola = esame.matricola;



🧠 Frase per ricordare:
FULL JOIN = TUTTO da SINISTRA e TUTTO da DESTRA, anche se non combacia

--FULL JOIN mostra le tab1 DESTRA E tab2 SINISTRA FA VEDERE TUTTO ANCHE SE HANNO CROISPONZE O MENO FA VEDERE TUTTO 
SELECT colonne FROM TAB1 FULL JOIN TAB2 ON TAB1.COL= TAB2.COL;
SELECT * FROM studente FULL JOIN esame ON stuente.matricola= esame.matricola;

--abbreviato
SELECT *  FROM stdente  as a FULL JOIN esame  as e ON s.matricola= e.matricola;

🎓 TABELLA studente (SINISTRA)                        📝 TABELLA esame (DESTRA)
		| matricola | nome   |                        | id\_esame | matricola | materia    | voto |
        | --------- | ------ |                        | --------- | --------- | ---------- | ---- |
        | 1         | Marco  |                        | 101       | 1         | Matematica | 28   |
        | 2         | Laura  |                        | 102       | 2         | Storia     | 30   |
        | 3         | Giulia |                        | 103       | 5         | Fisica     | 26   |


🔁 QUERY CON FULL JOIN
SELECT s.nome, e.materia, e.voto
FROM studente AS s
FULL JOIN esame AS e ON s.matricola = e.matricola;

✅ OUTPUT
| nome   | materia    | voto |
| ------ | ---------- | ---- |
| Marco  | Matematica | 28   |
| Laura  | Storia     | 30   |
| Giulia | NULL       | NULL |
| NULL   | Fisica     | 26   |

🧠 FRASE PER MEMORIZZARE
🔄 FULL JOIN = TUTTO da SINISTRA + TUTTO da DESTRA
Anche se non combaciano, vengono mostrati, con NULL dove mancano dati.


-------------------------------------------------- FUNZIONE AGGREGAZIONE -----------------------------
🧮 PRINCIPALI FUNZIONI DI AGGREGAZIONE

COUNT(*)	    Conta quante righe ci sono               	 SELECT COUNT(*) FROM studenti;
SUM(colonna)  Somma i valori di una colonna numerica	     SELECT SUM(stipendio) FROM impiegati;
AVG(colonna)	Calcola la media dei valori	                 SELECT AVG(voto) FROM esami;
MIN(colonna)	Trova il valore minimo	                     SELECT MIN(età) FROM studenti;
MAX(colonna)	Trova il valore massimo	                     SELECT MAX(età) FROM studenti;

🧠 ESEMPIO CON GROUP BY

SELECT materia, AVG(voto) AS media_voti
FROM esami
GROUP BY materia;



-- COUNT() CONTEGGIA I NUMERO DEI RIGHE NEI DATI INSIEME DI DATI 
SELECT COUNT (*) FROM studente;-- ti mette il totale conteggi righe ti fa vedere tutte righe della tabella quinti ti conta in questo caso come esemipio ti da 11   IN QUESTO CASO TI CONTEGGIA NULL
SELECT COUNT (nome) FROM studente; --ti conteggia il totale con il nome se trovi i all interno della colonna con i nomi ma ce null  quindi i null non te li conteggia qua esempio sarebbe 10	 
SELECT COUNT(nome) AS conteggio FROM stuente; -- se io voglio dare al nome al conteggio mi spiego meglio conteggio scegli tu dare il nome quello che vuoi quindi ai un nuovo nome alla colonna 
SELECT COUNT(materia) AS totale FROM esami;
SELECT COUNT (materia) FROM esami;
SELECT COUNT (DISTINCT materia) FROM esami; -- DISTINCT ti fa evitare di vedere i duplicati ti fa edere quante sono le colonne e conteggia senza i i duplicati 
SELECT DISTINCT materia FROM esame;-- TI FA VEDERE quali sono i nomi delle materie 
--SUM fa vedere la somma valori delle colonne o un insieme delle colonne 
--altro esempio magazzino un altra tabella  interno della tabela le colonne articoli codicearticoli quantita prezzo
SELECT SUM (quantita)FROM magazzino;-- uso sum per sapere il totale della quantita quindi ti da totale quantita esmp 157
SELECT SUM (prezzo)FROM magazzino;-- ti da il totale del prezzo esempio 18000 QUESTO SAREBBE TOTALE SINGOLO articolo 
-- in caso in cui se ci sono 1 articolo quanta 2 prezzo 10   come faccio a fare 10*2=20 
-- SI USA FAI QTATINTA*PREZZO
SELECT SUM (quantita*prezzo)FROM magazzino;-- coinvolgi tutto 
--MIN  se voglio trovare il prezzo piu basso 
SELECT MIN (prezzo)FROM magazzino;-- ti fa vedere il prezzo piu basso 
--MAX se io voglio vedere il prezzo piu alto
SELECT MAX (prezzo)FROM magazzino;-- prezzo piu alto 
-- AVG avarage e la media valori determinata colonna detreminata una tabella 
SELECT AVG(voto) AS media FROM esame WHERE matricola=1000;--eempio degli studenti voglio vedere lo studente la media 
SELECT AVG(voto) AS media FROM esami;-- ti va vedere la media degli tutti stundenti trane con null 
SELECT AVG(nomecolonna) AS nomemedia FROM TAB2;-- ti va vedere la media degli tutti stundenti trane con null 

------------------------------------ CLAUSOLA DI RAGGRUPAMENTO GROUP BY ------------------------------------------------
-- vorrei ragruppare le righe con lo stesso nome valore unico 
ORDINE SINTASSI 
✅ ORDINE SINTASSI SQL               
SELECT colonna, funzione_aggregata()   || SELECT materia
FROM nome_tabella                      || FROM esami
GROUP BY colonna;                      || GROUP BY materia;

1️⃣ GROUP BY
Raggruppa i dati in base a una colonna, utile con funzioni aggregate (COUNT, AVG, SUM, ecc.).

SELECT materia, COUNT(*) AS numero_esami
FROM esami
GROUP BY materia;


SELECT materia FROM esami GROUP BY materia;-- per creare unico gruppo te li mette insieme nel senso fisica sono 4 matematica 5 te li mette insieme ome gruppo quindi te raggruppa invece di vedere individualmente

✅ ORDINE SINTASSI SQL CONTA                
SELECT colonna, COUNT funzione_aggregata()  || SELECT materia COUNT(*)
FROM nome_tabella                           || FROM esami
GROUP BY colonna;                           || GROUP BY materia;

Conta quante volte compare ogni materia
SELECT materia, COUNT(*)
FROM esami
GROUP BY materia;

SELECT materia, COUNT(materia) FROM esami GROUP BY materia;-- ti coteggia quante volte la riga di un gruppo  ti fa vedere i risultati specifici fisica 4  matematica 5 

✅ ORDINE SINTASSI SQL AVG MEDIA               
SELECT colonna, AVG funzione_aggregata()  || SELECT materia AVG(*)
FROM nome_tabella                      || FROM esami
GROUP BY colonna;                      || GROUP BY materia;

⚠️ ATTENZIONE: Regola importante
Ogni colonna nel SELECT deve:
stare nel GROUP BY
oppure
essere dentro una funzione (es. COUNT, AVG, SUM…)
❌ Altrimenti SQL dà errore

SELECT materia, AVG(voto) FROM esami GROUP BY materia;-- conosco la media di ogni gruppo 
SELECT matricola, AVG(voto) FROM esami GROUP BY materia;-- se io voglio sapere la media del ogni studenti metto la colonna matricola

🧠 Frase per ricordare:
"Se Fosse Vero, Giuro Ordino!"
📌 Ogni parola ti aiuta a ricordare una parte della query:
Se → SELECT → SE 
Fosse → FROM →FOSSE 
Vero → WHERE →D
Giuro → GROUP BY →GIURO 
Ordino → ORDER BY →ORDINO

✅ RIASSUNTO VELOCE
| Obiettivo                | Query SQL                                                   |
| ------------------------ | ----------------------------------------------------------- |
| Materie senza doppioni   | `SELECT materia FROM esami GROUP BY materia`                |
| Quanti esami per materia | `SELECT materia, COUNT(*) FROM esami GROUP BY materia`      |
| Media voti per materia   | `SELECT materia, AVG(voto) FROM esami GROUP BY materia`     |
| Media voti per studente  | `SELECT matricola, AVG(voto) FROM esami GROUP BY matricola` |

✅ TRADUZIONE DELLO SCHEMA SQL

SELECT materia, AVG(voto)          -- 1. Cosa vuoi vedere (colonne o calcoli)
FROM esami                         -- 2. Da dove (nome della tabella)
WHERE voto >= 6                    -- 3. Quali righe vuoi filtrare (condizione)
GROUP BY materia                   -- 4. Come vuoi raggruppare i dati
ORDER BY materia ASC;              -- 5. Ordina i risultati


SELECT s.nome, s.cognome, AVG(voto) FROM studente AS s inner JOIN esame  AS e ON s.matricola=e.matricola GROUP BY s.nome, s.cognome; -- se io voglio sapere la media e i nomi dei studenti e cognomi dei studentti devo fare inner join tab1stuente e tab2 esami 


--Schema rapido SQL in italiano
SELECT    → seleziona colonne da vedere                           ||SELECT s.nome, e.materia, AVG(e.voto) AS media_voto
FROM      → da quale tabella (o tabelle)                          ||FROM studente AS s
JOIN      → unisci le tabelle in base a una condizione LFT/RGT    ||INNER JOIN esame AS e ON s.matricola = e.matricola
WHERE     → filtra le righe (condizioni)                          ||WHERE e.voto >= 18
GROUP BY  → raggruppa i dati per colonna/e                        ||GROUP BY s.nome, e.materia
ORDER BY  → ordina i risultati                                    ||ORDER BY s.nome, e.materia;

✅ SCHEMA RAPIDO SQL 
SELECT → FROM → JOIN → WHERE → GROUP BY → ORDER BY

--AVG

SELECT s.nome, s.cognome, e.matricola AVG(voto) FROM studente AS s inner JOIN esame  AS e ON s.matricola=e.matricola GROUP BY s.nome, s.cognome, e.matricola; -- se io voglio sapere la media e i nomi dei studenti e cognomi dei studentti  matricola devo fare inner join tab1stuente e tab2 esami 
SELECT s.nome, s.cognome, e.matricola COUNT(voto) FROM studente AS s INNER JOIN esame AS e ON s.matricola=e.matricola GROUP BY s.nome, s.cognome, e.matricola;-- se voglio sapere quanto materie ogni dato studente

✅ ORDINE SINTASSI SQL
SELECT ...   AVG    -- 1. Cosa vuoi vedere (colonne o calcoli)
FROM ...         -- 2. Da dove (tabella o tabelle con JOIN)
WHERE ...        -- 3. Filtri sulle righe (condizioni)
GROUP BY ...     -- 4. Raggruppa i dati (per usare funzioni aggregate)
ORDER BY ...     -- 5. Ordina i risultati (opzionale)

SELECT s.nome, e.materia, AVG(e.voto) AS media_voto  -- 1. Cosa vuoi visualizzare (colonne + calcolo)
FROM studente AS s                                  -- 2. Da dove (tabella principale)
INNER JOIN esame AS e ON s.matricola = e.matricola -- 3. Come unisci le tabelle (join con condizione)
GROUP BY s.nome, e.materia                          -- 4. Raggruppa per studente e materia

-- HAVING
SELECT s.nome, s.cognome, e.matricola COUNT(voto) FROM studente AS s INNER JOIN esame AS e ON s.matricola=e.matricola GROUP BY s.nome, s.cognome, e.matricola HAVING COUNT(voto)>3;-- filtrare i dati e raggruppamenti  studenti che hanno dato piu di tre materie 
SELECT s.nome, s.cognome, e.matricola COUNT(voto) FROM studente AS s INNER JOIN esame AS e ON s.matricola=e.matricola  WHERE e.matricola IN (1000,1002)GROUP BY s.nome, s.cognome, e.matricola HAVING COUNT(voto)>3; -- con where ti filtra i dati 
ORDINE SINTASSI 
✅ ORDINE SINTASSI SQL 
1. SELECT      → Cosa vuoi visualizzare (colonne o calcoli) COUNT(*) AS numero_studenti
2. FROM        → Da quale tabella
3. WHERE       → Filtro sui dati (quali righe vuoi)
4. GROUP BY    → Raggruppa i dati (se usi funzioni come COUNT, SUM, AVG...)
5. HAVING      → Filtro sui gruppi 
6. ORDER BY    → Ordina i risultati

🔍 Tradotto secondo il tuo schema:
SELECT colonna1, colonna2 COUNT(*) AS numero_studenti  -- 1. Cosa vuoi vedere || SELECT colonna1, colonna2  -- 1. Cosa vuoi vedere
FROM nome_tabella                   -- 2. Da dove (nome della tabella)        || FROM nome_tabella -- 2. Da dove (nome della tabella)
WHERE condizione                    -- 3. Quali righe vuoi filtrare           || WHERE condizione -- 3. Quali righe vuoi filtrare
GROUP BY colonna                    -- 4. Raggruppa i risultati               || GROUP BY colonna -- 4. Raggruppa i risultati
HAVING condizione_sul_gruppo        -- 5. Filtra i gruppi                     || HAVING condizione_sul_gruppo -- 5. Filtra i gruppi
ORDER BY colonna ASC|DESC;          -- 6. (Facoltativo) Ordina i risultati    || ORDER BY colonna ASC|DESC; -- 6. (Facoltativo) Ordina i risultati

🔁 Schema rapido da memorizzare:
SELECT  colonna1COUNT(*) AS numero_studenti → FROM nome_tabella     → WHERE condizione  → GROUP BY  colonna → HAVING  condizione_sul_gruppo COUNT(*) → ORDER BY  colonna 

SELECT classe, COUNT(*) AS numero_studenti      -- 1. Cosa vuoi vedere
FROM studenti                                   -- 2. Da dove
WHERE età >= 14                                 -- 3. Quali righe vuoi
GROUP BY classe                                 -- 4. Raggruppa per classe
HAVING COUNT(*) > 2                             -- 5. Filtra i gruppi
ORDER BY classe ASC;                            -- 6. Ordina in modo alfabetico




✅ ORDINE SINTASSI SQL – con AVG(*)
1. SELECT      → Cosa vuoi visualizzare (colonne o calcoli)
                ✅ Esempio: `SELECT classe, AVG(età) AS media_età`
2. FROM        → Da quale tabella
                ✅ Esempio: `FROM studenti`
3. WHERE       → Filtro sui dati **prima del raggruppamento**
                ✅ Esempio: `WHERE età >= 14`
4. GROUP BY    → Raggruppa i dati (per usare funzioni come AVG, COUNT...)
                ✅ Esempio: `GROUP BY classe`
5. HAVING      → Filtro sui gruppi (dopo GROUP BY)
                ✅ Esempio: `HAVING AVG(età) > 15`
6. ORDER BY    → Ordina i risultati
                ✅ Esempio: `ORDER BY media_età DESC`


🧠 CANZONE Frase per memorizzare l’ordine:
"Se Fai Wow, Guarda Hai Ordinato!"
S → SELECT→ SE 
F → FROM →FAI 
W → WHERE →WAO 
G → GROUP BY→ GUARDA 
H → HAVING →HAI 
O → ORDER BY →ORDINATO 



----------------------------------------------- INSERIRE I DATI INSERT INTO 
INSERT INTO tabella (colonna1, colonna2)  VALUES (valore1,valore2)
✅ ORDINE QUERY INSERT INTO
INSERT INTO nome_tabella (colonna1, colonna2, ...)
VALUES (valore1, valore2, ...);

✅ SCHEMA IN ITALIANO per INSERT INTO
-- INSERIRE I DATI IN UNA TABELLA

INSERT INTO nome_tabella        -- 1. Dove vuoi inserire i dati (nome della tabella) || INSERT INTO studenti (nome, età, classe)
(colonna1, colonna2, ...)       -- 2. In quali colonne della tabella                 || VALUES ('Luca', 16, '3A');
VALUES (valore1, valore2, ...); -- 3. Quali valori vuoi inserire                     ||


--ESEMPIO PRATICO 
INSERT INTO persona VALUES('LENADIPRGHZ982TORINOITALIA','Leonardo','Dipietro');
SELECT * FROM studente INSERT INTO studente (nome, cognome) VALUES ('Giuseppe', 'Bianchi');-- come faccio inserire i dati tabelle se i valori autoincrementano si aggiungono
SELECT * FROM studente INSERT INTO studente (nome, cognome) VALUES ('Giuseppe', 'Bianchi', 'Marta', 'Giotto', 'Elisa','Scarica');-- inserire piu persone 


🔁 Schema rapido da memorizzare:
INSERT INTO → (colonne) → VALUES (valori)

 


-----------------------------------------UPDATE MODIFICARE I DATI 
✅ ORDINE QUERY UPDATE
UPDATE nome_tabella         -- 1. Indica la tabella da modificare
SET colonna1 = valore1,     -- 2. Specifica quali colonne vuoi aggiornare
    colonna2 = valore2
WHERE condizione;           -- 3. (Molto importante!) Limita le righe da modificare
Tradotto secondo il tuo schema:
UPDATE nome_tabella     --> "update nome tabella"
SET colonna = valore    --> "set la modifica"
WHERE condizione        --> "where dove posso mettere"

✅ Schema semplice in italiano:
--esempio pratico 
UPDATE nome_tabella        -- 👉 1. Nome della tabella da modificare   || UPDATE studenti
SET colonna = valore       -- 👉 2. Cosa vuoi cambiare (la modifica)   || SET età = 19
WHERE condizione;          -- 👉 3. Dove (quali righe vuoi modificare) || WHERE nome = 'Marco';

UPDATE tabella set colinna1=valore where condizione;
update esame set voto=25 where id_esame=7;  --set sarebbe modificare where origine specifi la righa che vuoi fare la modifica  
update esame set voto=25 ; -- ti modifica tutto senza specificazione del where ti mette tutto 25  attenzione
update studente set nome= 'Antonino' where matricola=1002; -- modifica del nuovo nome ho specificato quale riga da modificare 
update studente set nome='Giada', cpgnome='Lia' where matricola=1004; -- se io voglio modificare nome e cognome 

⚠️ Importante:
UPDATE → sempre per primo
SET → dice cosa cambiare
WHERE → dice quali righe cambiare (senza di questo cambia tutto!)


🧠 CANZONE Frase per memorizzare l’ordine:
"Una Semplice Modifica, ma Dove?"
U → UPDATE → UNA  
S → SET → SEMPLICE MODIFICA  
D → WHERE → D dove applicare la modifica (condizione!)

--------------------------------------------------CREATE TABLE 
Sintassi base per creare una tabella
CREATE TABLE nome_tabella (
    colonna1 tipo_dato [opzioni],
    colonna2 tipo_dato [opzioni],
    colonna3 tipo_dato [opzioni],
    ...
);

🔹nome_tabella = nome della tabella che vuoi creare
colonna1, colonna2, ... = nomi delle colonne
tipo_dato = tipo di dato (es. INT, VARCHAR, DATE, ecc.)
opzioni = ad esempio PRIMARY KEY, NOT NULL, AUTO_INCREMENT, ecc.

🔹 Esempio pratico
Creiamo una tabella studente con:
matricola (numero intero, chiave primaria)
nome (stringa max 50 caratteri)
cognome (stringa max 50 caratteri)
data_nascita (data)


CREATE TABLE studente (
    matricola INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    data_nascita DATE
);

Spiegazione
matricola INT PRIMARY KEY → numero intero, identificatore unico per ogni studente
nome VARCHAR(50) NOT NULL → stringa fino a 50 caratteri, obbligatoria (non può essere NULL)
cognome VARCHAR(50) NOT NULL → stringa fino a 50 caratteri, obbligatoria
data_nascita DATE → data di nascita, può essere vuota

Regole CREATE TABLE
Nome tabella
Deve essere un identificatore unico nel database.
Non può contenere spazi o caratteri speciali (usa underscore _ se vuoi).

Definizione colonne
Ogni colonna deve avere un nome unico nella tabella.
Ogni colonna deve avere un tipo di dato (es: INT, VARCHAR, DATE, FLOAT).
Puoi specificare le dimensioni per i tipi variabili (es: VARCHAR(50)).

Vincoli (constraints)
Puoi aggiungere vincoli per assicurare l’integrità dei dati:

PRIMARY KEY: identifica la colonna o insieme di colonne uniche e non NULL.
NOT NULL: la colonna deve contenere un valore (non può essere NULL).
UNIQUE: la colonna deve avere valori unici (ma può essere NULL).
DEFAULT valore: imposta un valore di default se non ne viene fornito uno.
CHECK: definisce una condizione che i valori devono rispettare.
FOREIGN KEY: crea un collegamento con un’altra tabella.

Ordine della definizione
Prima elenchi tutte le colonne con nome, tipo e vincoli.
Poi eventuali vincoli a livello tabella (es. PRIMARY KEY (col1, col2)).
Tipi di dato comuni

Numerici: INT, SMALLINT, BIGINT, DECIMAL, FLOAT.
Testo: CHAR(n), VARCHAR(n), TEXT.
Data e ora: DATE, TIME, DATETIME, TIMESTAMP.
Booleano: BOOLEAN o BIT (dipende dal DB).

Nomi colonne e tabelle
Evita parole riservate del SQL (es. SELECT, WHERE).
Usa nomi descrittivi e senza spazi.

Sintassi corretta
Usa la virgola per separare le definizioni di colonne.
La definizione termina con un punto e virgola ;.

Esempio sintetico
CREATE TABLE studenti (
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    eta INT CHECK (eta >= 0),
    email VARCHAR(100) UNIQUE,
    iscrizione DATE DEFAULT CURRENT_DATE
);












esempio 
📊 Data Analyst e SQL
Cosa fa un Data Analyst?
Esplora e analizza dati per supportare decisioni aziendali.
Crea report, dashboard, e insight da dati strutturati.
Spesso lavora con dati raccolti da database relazionali (es. SQL Server, MySQL, PostgreSQL).

Come usa SQL?
Estrazione dati: scrive query SQL per estrarre dati specifici da grandi database.
Pulizia dati: filtra, ordina, e prepara dati con WHERE, JOIN, GROUP BY ecc.

Aggregazioni: usa funzioni come COUNT(), AVG(), SUM() per riassumere dati.
Reportistica: crea dataset con dati aggregati per report o visualizzazioni.
Analisi ad hoc: risponde a domande specifiche esplorando i dati.
Esempio tipico per Data Analyst con SQL:

SELECT cliente_id, COUNT(*) AS ordini_totali, AVG(importo) AS media_spesa
FROM ordini
WHERE data_ordine BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY cliente_id
ORDER BY media_spesa DESC;

🤖 Data Scientist e SQL
Cosa fa un Data Scientist?
Costruisce modelli predittivi, analisi statistiche e machine learning.
Usa grandi dataset anche da database relazionali o big data.
Combina SQL con linguaggi come Python o R per analisi avanzate.

Come usa SQL?
Preprocessing dati: estrae e trasforma dati da database come base per i modelli.
Feature engineering: crea nuove variabili (features) da dati grezzi usando SQL.
Data exploration: analizza distribuzioni, valori nulli, correlazioni.
Unione dati: usa JOIN per combinare tabelle diverse (es. clienti, ordini, feedback).
Pipeline dati: automatizza estrazione e pulizia dati per modelli.
Esempio tipico per Data Scientist con SQL:

SELECT u.user_id, COUNT(o.order_id) AS num_ordini, AVG(o.importo) AS spesa_media
FROM utenti u
LEFT JOIN ordini o ON u.user_id = o.user_id
WHERE u.data_registrazione > '2023-01-01'
GROUP BY u.user_id;

PULIRE I DATI 
1. Rimuovere duplicati
Usa DISTINCT o ROW_NUMBER() per eliminare righe duplicate.
-- Mostra righe uniche (rimuove duplicati)
SELECT DISTINCT *
FROM tabella;

-- Oppure elimina duplicati tenendo solo una riga (esempio con ROW_NUMBER)
WITH CTE AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY col1, col2 ORDER BY id) AS rn
  FROM tabella
)
DELETE FROM CTE WHERE rn > 1;

2. Gestire valori NULL
Sostituisci valori nulli con un valore di default usando COALESCE() o ISNULL().
SELECT nome, 
       COALESCE(email, 'email_non_disponibile') AS email_pulita
FROM studente;

3. Filtrare dati non validi
Rimuovi o segnala righe con valori anomali o non validi.
-- Escludi voti non validi (ad esempio, voto < 0 o > 30)
SELECT *
FROM esame
WHERE voto BETWEEN 0 AND 30;

4. Correggere dati formattati male
Usa funzioni stringa per ripulire dati (es. rimuovere spazi).
-- Rimuove spazi all’inizio e alla fine
SELECT TRIM(nome) AS nome_pulito
FROM studente;

5. Unire dati coerenti
Usa JOIN per combinare dati e assicurarti che i riferimenti siano corretti.
SELECT s.matricola, s.nome, e.materia, e.voto
FROM studente s
INNER JOIN esame e ON s.matricola = e.matricola
WHERE e.voto IS NOT NULL;

6. Aggiornare valori errati
-- Aggiorna valori errati, ad esempio correggi nome errato
UPDATE studente
SET nome = 'Giovanni'
WHERE nome = 'Gionvanni';

Riassunto sintetico passi pulizia dati in SQL
Rimuovi duplicati (DISTINCT o ROW_NUMBER())
Gestisci valori NULL (COALESCE, ISNULL)
Filtra dati anomali (WHERE)
Correggi formattazione (TRIM, UPPER, LOWER)
Controlla integrità referenziale (JOIN)
Aggiorna dati errati (UPDATE)

Ti faccio un esempio completo di pulizia dati in SQL usando una tabella fittizia chiamata studente con queste colonne:
matricola (int)
nome (varchar)
cognome (varchar)
email (varchar, può contenere NULL o valori con spazi)
voto (int, può contenere valori errati o NULL)
corso (varchar, può contenere duplicati o valori inconsistenti)

Ecco i dati "sporchi" di partenza (immaginari):
| matricola | nome      | cognome | email                                               | voto | corso       |
| --------- | --------- | ------- | --------------------------------------------------- | ---- | ----------- |
| 101       | Marco     | Rossi   | [marco.rossi@mail.it](mailto:marco.rossi@mail.it)   | 28   | Informatica |
| 102       | Giacomo   | Bianchi | NULL                                                | 31   | Ingegneria  |
| 103       | Gionvanni | Verdi   | [gionvanni@mail.it](mailto:gionvanni@mail.it)       | 25   | informatica |
| 104       | Laura     | Neri    | [laura.neri@mail.it](mailto:laura.neri@mail.it)     | NULL | Informatica |
| 101       | Marco     | Rossi   | [marco.rossi@mail.it](mailto:marco.rossi@mail.it)   | 28   | Informatica |
| 105       | Anna      | Ferrari | [anna.ferrari@mail.it](mailto:anna.ferrari@mail.it) | 22   | Matematica  |
| 106       | Paolo     | Verdi   | [paolo.verdi@mail.it](mailto:paolo.verdi@mail.it)   | -5   | Matematica  |
| 107       | Luca      | Bianchi | [luca.bianchi@mail.it](mailto:luca.bianchi@mail.it) | 27   | Ingegneria  |

Passi per pulire dati con SQL:
1. Rimuovere duplicati
WITH CTE AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY matricola, nome, cognome, email, voto, corso ORDER BY matricola) AS rn
  FROM studente
)
DELETE FROM CTE WHERE rn > 1;

2. Gestire valori NULL nelle email (sostituisco con 'email_non_disponibile')
SELECT matricola, nome, cognome,
       COALESCE(email, 'email_non_disponibile') AS email_pulita,
       voto, corso
FROM studente;

3. Filtrare voti errati (voti validi tra 0 e 30)
SELECT *
FROM studente
WHERE voto BETWEEN 0 AND 30 OR voto IS NULL;

4. Correggere formattazione in corso (tutto maiuscolo per uniformare)
UPDATE studente
SET corso = UPPER(TRIM(corso));

5. Aggiornare nomi errati (es. Gionvanni → Giovanni)
UPDATE studente
SET nome = 'Giovanni'
WHERE nome = 'Gionvanni';

6. Mostrare dati puliti
SELECT DISTINCT matricola, nome, cognome, 
       COALESCE(email, 'email_non_disponibile') AS email_pulita,
       voto, corso
FROM studente
WHERE voto BETWEEN 0 AND 30 OR voto IS NULL;
✅ 1. Mostrare solo gli esami con voto assegnato

SELECT * FROM esame
WHERE voto IS NOT NULL;
🔹 Restituisce solo chi ha già sostenuto l’esame.

✅ 2. Mostrare solo gli esami ancora da sostenere (voto mancante)
sq
SELECT * FROM esame
WHERE voto IS NULL;
🔹 Perfetto per capire chi non ha ancora un voto.

✅ 3. Sostituire i NULL con un valore “finto” o simbolico (COALESCE)
SELECT materia, COALESCE(voto, 0) AS voto_pulito
FROM esame;
🔸 Ti mostra 0 al posto dei NULL, utile se serve per calcoli.

Oppure:

SELECT materia, COALESCE(voto, 'non sostenuto') AS voto_stato
FROM esame;
🔹 Così ottieni "non sostenuto" invece di NULL (utile nei report).

✅ 4. Calcolare la media ignorando i NULL

SELECT AVG(voto) AS media_voti
FROM esame
WHERE voto IS NOT NULL;
🔹 AVG() ignora automaticamente i NULL, ma filtrare con IS NOT NULL è buona pratica.

✅ 5. Aggiornare i NULL con un voto fisso (solo se serve!)
sql
Copier
Modifier
UPDATE esame
SET voto = 18
WHERE voto IS NULL;
⚠️ Attenzione! Questo modifica i dati! Fallo solo se ha senso dare un voto di default (es. "promosso d’ufficio").

💡 Riassunto rapido
Obiettivo	Cosa usare
Mostrare solo con voto	WHERE voto IS NOT NULL
Mostrare solo senza voto	WHERE voto IS NULL
Sostituire NULL con valore	COALESCE(voto, valore)
Evitare errori nei calcoli	AVG(voto) o IS NOT NULL
Aggiornare NULL con un valore	UPDATE ... SET voto = ...

Se vuoi, ti preparo una mini simulazione con dati reali SQL da provare, o un quiz riepilogativo. Vuoi?

🧹 COSA FANNO I DATA ANALYST PER PULIRE I DATI?
Ecco un elenco chiaro e pratico:

🔍 1. Rimuovere duplicati
Evitare di contare gli stessi dati due volte.
In SQL:
WITH CTE AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY col1, col2 ORDER BY id) AS rn
  FROM tabella
)
DELETE FROM CTE WHERE rn > 1;

❌ 2. Gestire i valori NULL o mancanti
Opzioni:
Rimuoverli:
SELECT * FROM tabella WHERE colonna IS NOT NULL;
Sostituirli con un valore predefinito:
SELECT COALESCE(colonna, 'Sconosciuto') FROM tabella;

🔠 3. Standardizzare il formato
Rendere uniforme il testo (maiuscolo/minuscolo):
SELECT UPPER(nome), LOWER(cognome) FROM clienti;
Uniformare date, numeri, ecc.

🔢 4. Convertire tipi di dato
Assicurarsi che i dati siano nel tipo corretto (es. numero, data):
SELECT CAST(voto AS INT) FROM esame;

🔤 5. Togliere spazi extra
Pulizia delle stringhe:

SELECT TRIM(nome) FROM studenti;

🔧 6. Correggere errori manuali o incoerenze
Es. "Milano" scritto come "milano", "Milan", "MI".
Si possono usare REPLACE o CASE:
SELECT
  CASE
    WHEN città IN ('MI', 'Milan') THEN 'Milano'
    ELSE città
  END AS città_corretto
FROM clienti;

🔎 7. Controllare i dati anomali
Valori troppo alti/bassi:
SELECT * FROM vendite WHERE prezzo < 0;












🎓 TABELLA 1: studente
| matricola | nome  | cognome | email                                                   |
| --------- | ----- | ------- | ------------------------------------------------------- |
| 1001      | Marco | Rossi   | [marco.rossi@email.it](mailto:marco.rossi@email.it)     |
| 1002      | Lucia | Bianchi | [lucia.bianchi@email.it](mailto:lucia.bianchi@email.it) |
| 1002      | Lucia | Bianchi | [lucia.bianchi@email.it](mailto:lucia.bianchi@email.it) |
| 1003      | Paolo | verdi   | [paolo.verdi@email.it](mailto:paolo.verdi@email.it)     |
| 1004      | NULL  | Neri    | NULL                                                    |

📚 TABELLA 2: esame
| id\_esame | matricola | materia    | voto |
| --------- | --------- | ---------- | ---- |
| 1         | 1001      | Matematica | 30   |
| 2         | 1002      | Fisica     | NULL |
| 3         | 1003      | matematica | 25   |
| 4         | 1005      | Filosofia  | -1   |
| 5         | 1001      | Matematica | 30   |

🧹 1. Rimuovere duplicati da studente
WITH cte AS (
  SELECT *, ROW_NUMBER() OVER (
    PARTITION BY matricola, nome, cognome, email
    ORDER BY matricola
  ) AS rn
  FROM studente
)
DELETE FROM cte WHERE rn > 1;

🧽 2. Filtrare o sostituire i NULL
-- Filtrare
SELECT * FROM studente WHERE nome IS NOT NULL;

-- Sostituire NULL con 'sconosciuto'
SELECT COALESCE(nome, 'Sconosciuto') AS nome FROM studente;

🔠 3. Standardizzare formato nomi
SELECT 
  UPPER(TRIM(nome)) AS nome_clean,
  INITCAP(TRIM(cognome)) AS cognome_clean
FROM studente;
INITCAP funziona in alcuni database per avere “Marco” invece di “MARCO”.

🔢 4. Correggere tipo e valore anomalo nel voto
-- Voti validi: da 18 a 30
SELECT * FROM esame WHERE voto BETWEEN 18 AND 30;

-- Sostituire valori errati (es. -1)
SELECT 
  CASE 
    WHEN voto < 18 OR voto > 30 THEN NULL
    ELSE voto 
  END AS voto_clean
FROM esame;

🔄 5. Correggere errori ortografici in materia
SELECT 
  CASE 
    WHEN LOWER(TRIM(materia)) = 'matematica' THEN 'Matematica'
    WHEN LOWER(TRIM(materia)) = 'fisica' THEN 'Fisica'
    ELSE materia
  END AS materia_clean
FROM esame;
