--Ciao tutti benvenuti al mio blog in Mydatabreakfast in questo momento vi glio fare vedere come si pulisce i dati come me per i principianti non preicupatievi anche a me fa paura ma possiamo annalizzare insieme anzi a divertirci spero che questo vi possa aiurare  questo creato un piccolo esempio 
DROP TABLE IF EXISTS contanti_clienti; -- inizio io avevo creato una tabella ma inserendo dati mi crea probmlemi non preuppate basta fare drop table e IF se exists se esiste lui te lo fa vedere automatico bonus problem solving 
CREATE TABLE contanti_clienti(
id INT,
nome NVARCHAR(250),
telefono NVARCHAR(250),
email NVARCHAR(250),
genere NVARCHAR(250),
città NVARCHAR(250),
azienda NVARCHAR(250),
ecommerce_preferito NVARCHAR(250)
);
-- dopo che abbiamo controlatto se funzionano inserimento delle tabelle ora possiamo colotrollare 
SELECT *
FROM contanti_clienti
-- perfetto ora ci siamo abbialo la nostra tabella ma dobbialo inserire i dati 
INSERT INTO contanti_clienti (id, nome, telefono, email, genere, città, azienda, ecommerce_preferito) 
VALUES(1, 'LUCA', '333-123-4567', 'LUCA@EMAIL.IT', 'M', 'Roma', NULL, 'amazon'),
(2, ' lucia ', '(333)1234567', 'lucia@email.it', 'F', 'roma', 'Super Srl', 'AMAZON'),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'marco', '3331234567', 'marco@email.it', 'M', 'Milano', 'Tech Spa', 'ebay'),
(5, 'Lucia', '333 123 4567', 'LUCIA@EMAIL.IT', 'f', '  Roma ', 'super srl', 'Amazon');

SELECT *
FROM contanti_clienti

-- ORA SI INIZIAMO A FARE ANALISTA DEI DATI  a me piace molto definirmi due cose o facciamo break-data o dective io adoro break-date perche mi sento che devo mangiarli ovvero anche clean-break 
--1 come vediamo da tutte le colonne ci siano NULL ovvero anche un record NULL completo io lo chiamo NULL-break
--2 vediamo le stringe o le parole che siamo minuscole o maiuscole dovete entrare nel mondo del cliente o del vostro colega questo dipende come compilano i dati 
--3 vediamo il numero di telefoni con ()  o -  o con i spazi vuoiti 
 
 --bene dobbiamo che abbiamo analizzato a fare break-data o clean-break
 --abbiamo 2 possibilita  il rpimo possibilita con UPDATE  potete modificare il dato pro potete modificare una singola colonna ma contro se dovete modificare tutte le collone ci impieghere tanto 
 UPDATE contanti_clienti
 SET nome ='Sconisciuto'
 WHERE nome IS NOT NULL OR TRIM(nome)=' ';

  -- secondo la possibilita in modo veloce che ci salva COALESCE

  UPDATE contanti_clienti
  SET
  nome= COALESCE(nome,'Sconosciuto'),
  email= COALESCE(email, 'Sconosciuto@gmail.it'),
  genere= COALESCE(genere, 'Sconosciuto'),
  telefono= COALESCE(telefono, 'N/D'),
  azienda= COALESCE(azienda, 'Sconosciuto'),
  città= COALESCE(città, 'Sconosciuto'),
  ecommerce_preferito= COALESCE(ecommerce_preferito, 'ecommerce_preferito')
  WHERE
  nome IS NULL OR email IS NULL OR genere IS NULL OR telefono IS NULL OR azienda IS NULL OR città IS NULL OR ecommerce_preferito IS NULL;

  SELECT *
  FROM contanti_clienti;


-- come togliere i duplicati  
WITH Duplicati AS (       
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY LOWER(TRIM(email)) ORDER BY id) AS rn
  FROM contanti_clienti
)
DELETE FROM Duplicati
WHERE rn > 1;

SELECT *
FROM contanti_clienti;

-- ora possiamo  
SELECT *
FROM contanti_clienti
--un altro metodo veloce in caso in cuoi dovresti selezionare le colonne LOWER sei la nostra salvezza invece mysql sono diversi 
SELECT
  id,
  LOWER(TRIM(nome)) AS nome_pulito, -- Nome tutto minuscolo e senza spazi ai lati
  REPLACE(REPLACE(REPLACE(telefono, '-', ''), '(', ''), ')', '') AS telefono_pulito, -- Telefono senza prima fase '-',('-', '') vuoto ''itendo di togliere  -- seconda delle parentesi iniziale fase , '(', ''),|ho messo il sepatore cosi capisci -- terza fase la parte finale della parentesi e intenedere il cembiamento vuoto ')', '')                      ('-', '')
  LOWER(email) AS email_pulita,   -- Email tutto minuscolo
  UPPER(genere) AS genere_pulito,   -- Genere tutto maiuscolo
  LOWER(TRIM(città)) AS città_pulita, --Città tutto minoscuolo 
  LOWER(TRIM(azienda)) AS azienda_pulita, -- Azienda tutto minuscolo e spazi rimossi
  LOWER(ecommerce_preferito) AS ecommerce_pulito--Ecommerce tutto minuscolo
FROM  contanti_clienti;
-- finalmeneto abbiamo finito e molto semplice ho dato dei piccoli truccheti ma so che ne faremo degli data_clean_break 
-- grazie mlille che hi letto il mio blog mydata breakfast spero che 



