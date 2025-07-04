-- In questo moneto abbiamo fatto una simulazione come si pulisce i dati una azienda xxx ecomerce
DROP TABLE IF EXISTS stock_clienti;

CREATE TABLE stock_clienti (
    id INT,
    nome NVARCHAR(50),
    cognome NVARCHAR(50),
    email NVARCHAR(100),
    telefono NVARCHAR(30),
    genere NVARCHAR(10),
    citta NVARCHAR(50),
    status NVARCHAR(20),
    lavoro NVARCHAR(50),
    salario NVARCHAR(20),
    tesserato NVARCHAR(10),
    sconto_tessera NVARCHAR(10),
    bonus_carta_regalo NVARCHAR(10),
    buono_cliente NVARCHAR(10),
    spesa_totale NVARCHAR(20),
    articoli_acquistati INT,
    prezzo_articolo NVARCHAR(20),
    ha_pagato NVARCHAR(5),
    buon_pagatore NVARCHAR(5),
    spedito NVARCHAR(5),
    data_entrata NVARCHAR(20),
    data_uscita NVARCHAR(20)
);

INSERT INTO stock_clienti VALUES
(1, 'Luca', 'Bianchi', 'luca.bianchi@', '3331234567', 'FEMMINA', 'Milano', 'Single', 'Impiegato', '2000', 'Sì', '10%', '5', 'Sì', '250', 3, '50', 'Sì', 'Sì', 'Sì', '2025-06-01', '2025-06-05'),
(2, 'Giorgia', 'Rossi', 'giorgia.rossi@gmail.com', '', 'MASCHIO', 'Roma', 'Sposato', 'Commesso', 'duemila', '', '20%', '15', 'No', '300', 5, '30', 'No', 'No', 'Sì', '2025-05-15', ''),
(3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', ''),
(4, 'Francesca', 'Blu', 'francesca.blu@gmail.com', '3409876543', 'FEMMINA', 'Torino', 'Single', 'Insegnante', '1800', 'Sì', '30%', '10', 'Sì', '600', 10, '60', 'Sì', 'Sì', 'Sì', '2025-06-10', '2025-06-12'),
(5, 'Marco', 'Neri', 'marco.neri.com', 'abc123', 'MASCHIO', 'Napoli', 'Fidanzato', 'Operaio', '', 'No', '', '8', '', '200', 4, '', 'Sì', 'No', 'No', '2025-07-01', '2025-07-05'),
(6, 'Samantha', 'Viola', 'samantha.viola@gmail', '327-123-4567', 'FEMMINA', 'Bari', '', '', '', '', '10%', '', 'No', '75', 1, '75', 'Sì', '', 'Sì', '', ''),
(7, 'Gianluca', 'Marrone', '', '', 'MASCHIO', 'Firenze', 'Single', 'Studente', '500', '', '', '', '', '', 0, '', 'No', '', 'No', '2025-07-01', '2025-07-01');

SELECT *
FROM stock_clienti;
----------------------------------------------------PULIZIA DEL DATO 

--pulizia del dato iniziamo le basi per pulizia 

UPDATE stock_clienti
SET nome ='Sconosciuto'
WHERE nome IS NULL  OR TRIM(nome)='';

UPDATE stock_clienti
SET cognome= 'Sconosciuto'
WHERE cognome IS NULL OR TRIM(cognome)=' ';

UPDATE stock_clienti
SET email= 'Sconosciuto'
WHERE email IS NULL OR TRIM(email)=' ';

UPDATE stock_clienti
SET citta= 'Sconosciuto'
WHERE citta IS NULL OR TRIM(citta)=' ';

 UPDATE stock_clienti
SET lavoro= 'Sconosciuto'
WHERE lavoro IS NULL OR TRIM(lavoro)=' ';

UPDATE stock_clienti
SET telefono = 'Sconosciuto'
WHERE telefono IS NULL 
   OR TRIM(telefono) = ''
   OR telefono LIKE '%[^0-9]%';  -- Contiene caratteri non numerici

   UPDATE stock_clienti
SET genere = CASE 
    WHEN LOWER(nome) IN ('luca', 'marco', 'gianluca') THEN 'MASCHIO'
    WHEN LOWER(nome) IN ('giorgia', 'francesca', 'samantha') THEN 'FEMMINA'
    ELSE 'Sconosciuto'
END
WHERE genere IS NULL OR TRIM(genere) = '';

--creare un altra tabella perche non ci stavano 11 caratteri perche precedente avevamo messo 10 
ALTER TABLE stock_clienti
ALTER COLUMN genere NVARCHAR(20);

UPDATE stock_clienti
SET genere = CASE 
    WHEN LOWER(nome) IN ('luca', 'marco', 'gianluca') THEN 'MASCHIO'
    WHEN LOWER(nome) IN ('giorgia', 'francesca', 'samantha') THEN 'FEMMINA'
    ELSE 'Sconosciuto'
END
WHERE genere IS NULL OR TRIM(genere) = '';

UPDATE stock_clienti
SET buono_cliente ='Sconosciuto'
WHERE buono_cliente IS NULL OR TRIM(buono_cliente) = '';

ALTER TABLE stock_clienti
ALTER COLUMN buono_cliente NVARCHAR(20);

UPDATE stock_clienti
SET buono_cliente ='Sconosciuto'
WHERE buono_cliente IS NULL OR TRIM(buono_cliente) = '';

ALTER TABLE stock_clienti
ALTER COLUMN  tesserato NVARCHAR(20);

UPDATE stock_clienti
SET tesserato ='Sconosciuto'
WHERE tesserato IS NULL OR TRIM(tesserato) = '';

ALTER TABLE stock_clienti
ALTER COLUMN spedito  NVARCHAR(20);

UPDATE stock_clienti
SET spedito ='Sconosciuto'
WHERE spedito IS NULL OR TRIM(spedito) = '';


ALTER TABLE stock_clienti
ALTER COLUMN buon_pagatore  NVARCHAR(30);

UPDATE stock_clienti
SET buon_pagatore='Sconosciuto'
WHERE buon_pagatore IS NULL OR TRIM(buon_pagatore) = '';

ALTER TABLE stock_clienti
ALTER COLUMN ha_pagato NVARCHAR(30);

UPDATE stock_clienti
SET ha_pagato='Sconosciuto'
WHERE ha_pagato IS NULL OR TRIM(ha_pagato) = '';

UPDATE stock_clienti
SET salario = NULL
WHERE TRY_CAST(salario AS INT) IS NULL;

ALTER TABLE stock_clienti
ALTER COLUMN sconto_tessera NVARCHAR(20);

UPDATE stock_clienti
SET sconto_tessera = 'Sconosciuto'
WHERE sconto_tessera IS NULL OR TRIM(sconto_tessera) = '';

ALTER TABLE stock_clienti
ALTER COLUMN prezzo_articolo NVARCHAR(50);

UPDATE stock_clienti
SET prezzo_articolo = 'Sconosciuto'
WHERE prezzo_articolo IS NULL OR TRIM(prezzo_articolo) = '';

ALTER TABLE stock_clienti
ALTER COLUMN prezzo_articolo NVARCHAR(50);

UPDATE stock_clienti
SET prezzo_articolo = 'Sconosciuto'
WHERE prezzo_articolo IS NULL OR TRIM(prezzo_articolo) = '';

ALTER TABLE stock_clienti
ALTER COLUMN spesa_totale NVARCHAR(50);

UPDATE stock_clienti
SET spesa_totale= 'Sconosciuto'
WHERE spesa_totale IS NULL OR TRIM(spesa_totale) = '';

ALTER TABLE stock_clienti
ALTER COLUMN data_entrata NVARCHAR(50);

UPDATE stock_clienti
SET  data_entrata= 'Sconosciuto'
WHERE  data_entrata IS NULL OR TRIM( data_entrata) = '';

ALTER TABLE stock_clienti
ALTER COLUMN data_uscita NVARCHAR(50);

UPDATE stock_clienti
SET  data_uscita= 'Sconosciuto'
WHERE  data_uscita IS NULL OR TRIM( data_uscita) = '';

ALTER TABLE stock_clienti
ALTER COLUMN status NVARCHAR(50);

UPDATE stock_clienti
SET  status = 'Sconosciuto'
WHERE  status  IS NULL OR TRIM( status) = '';

ALTER TABLE stock_clienti
ALTER COLUMN bonus_carta_regalo NVARCHAR(50);

UPDATE stock_clienti
SET  bonus_carta_regalo= 'Sconosciuto'
WHERE  bonus_carta_regalo IS NULL OR TRIM( bonus_carta_regalo) = '';

ALTER TABLE stock_clienti
ALTER COLUMN salario NVARCHAR(50);

UPDATE stock_clienti
SET  salario= 'Sconosciuto'
WHERE  salario IS NULL OR TRIM( salario) = '';

SELECT *
FROM stock_clienti;

UPDATE stock_clienti
SET email = 'Sconosciuto'
WHERE 
    email IS NULL            --email IS NULL	L'email è completamente assente
    OR TRIM(email) = ''      --TRIM(email) = ''	L'email contiene solo spazi o è vuota
    OR email NOT LIKE '%@%.%' --email NOT LIKE '%@%.%'	Non contiene la struttura base (es. nome@dominio.com)
    OR email LIKE '% %' --email LIKE '% %'	Contiene spazi vuoti, che non sono ammessi in un indirizzo email
    OR email LIKE '%.@%' --email LIKE '%.@%'	Ha un punto immediatamente prima della @, cosa non valida (es. nome.@g)
    OR email LIKE '@%' --email LIKE '@%'	Inizia con @, cosa non valida (es. @gmail.com)
    OR email LIKE '%.%' AND email NOT LIKE '%@%.%'; --email LIKE '%.%' AND NOT LIKE '%@%.%'	Ha un punto ma non ha una @ valida, sospetta

SELECT *
FROM  stock_clienti;

-----------------------------------------------------------------TUTTO ANALISI CONTO 

-- Quanti clienti sono buoni pagatori?
SELECT buon_pagatore, COUNT(*) AS numero_clienti
FROM stock_clienti
GROUP BY buon_pagatore;

--Quanti clienti hanno bonus carta regalo
SELECT bonus_carta_regalo, COUNT(*) AS numero_clienti
FROM stock_clienti
GROUP BY bonus_carta_regalo;

--Quanti clienti hanno bonus carta regalo
SELECT articoli_acquistati, COUNT(*) AS numero_clienti
FROM stock_clienti
GROUP BY  articoli_acquistati

SELECT tesserato, COUNT(*) AS genere 
FROM stock_clienti
GROUP BY tesserato;

--Quanti clienti hanno sconto_tessera
SELECT sconto_tessera, COUNT(*) AS numero_clienti
FROM stock_clienti
GROUP BY sconto_tessera;

-- Città con più clienti
SELECT citta, COUNT(*) AS clienti
FROM stock_clienti
GROUP BY citta
ORDER BY clienti DESC;




SELECT *
FROM stock_clienti


 ALTER TABLE stock_clienti
ALTER COLUMN spesa_totale NVARCHAR(250);

 -----------------------------------------------STATISTICA DESCRITTIVA 
 -- media spesa totale 
SELECT 
  AVG(TRY_CAST(spesa_totale AS FLOAT)) AS media_spesa
FROM stock_clienti;
--MIN
--OPPURE SCRIVERE COSI A 
SELECT MIN(TRY_CAST(salario AS INT)) AS  minomo_salario
FROM stock_clienti;
--OPPURE B 
SELECT MIN(TRY_CAST(salario AS INT)) AS  minomo_salario
FROM stock_clienti
WHERE TRY_CAST(salario AS INT) IS NOT NULL;

--MAX
--oppure a 
SELECT MAX(TRY_CAST(salario AS INT)) AS max_salario
FROM stock_clienti;
--oppure b
SELECT MAX(TRY_CAST(salario AS INT)) AS max_salario
FROM stock_clienti
WHERE TRY_CAST(salario AS INT) IS NOT NULL;



--Quanti clienti hanno spesa totale numerica
SELECT spesa_totale, TRY_CAST(spesa_totale AS FLOAT) AS spesa_numerica
FROM stock_clienti;

SELECT *
FROM stock_clienti;

----------------------------------------------------COMPARAZIONE DI GRUPPI 
-- raggruppamenti comparatvo 
SELECT * 
FROM stock_clienti 
WHERE tesserato = 'Sì' AND buon_pagatore = 'Sì' AND ha_pagato = 'Sì';


SELECT *
FROM stock_clienti 
WHERE spedito ='Sconosciuto' AND buon_pagatore='Sconosciuto' AND ha_pagato='Sconosciuto';

SELECT *
FROM stock_clienti;

------------------------------------------FILTRI 
-- spesa superiore 
SELECT * 
FROM stock_clienti 
WHERE TRY_CAST(spesa_totale AS FLOAT) > 300;


SELECT * 
FROM stock_clienti 
WHERE TRY_CAST(prezzo_articolo AS FLOAT) > 50;