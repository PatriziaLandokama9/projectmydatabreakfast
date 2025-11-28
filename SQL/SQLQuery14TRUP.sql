

DROP TABLE IF EXISTS Info_Paese;
DROP TABLE IF EXISTS Dazi;
DROP TABLE IF EXISTS Paesi;

CREATE TABLE Paesii (
    id_paesii INT PRIMARY KEY,
    paesei VARCHAR(100),
    continentei VARCHAR(50)
);
INSERT INTO Paesii (id_paesii, paesei, continentei) VALUES
(1, 'Unione Europea', 'Europa'),
(2, 'Cina', 'Asia'),
(3, 'Giappone', 'Asia'),
(4, 'Taiwan', 'Asia'),
(5, 'India', 'Asia'),
(6, 'Corea del Sud', 'Asia'),
(7, 'Svizzera', 'Europa'),
(8, 'Indonesia', 'Asia'),
(9, 'Repubblica Democratica del Congo', 'Africa'),
(10, 'Angola', 'Africa'),
(11, 'Australia', 'Oceania'),
(12, 'Canada', 'America'),
(13, 'Messico', 'America'),
(14, 'Argentina', 'America'),
(15, 'Isola Norfolk', 'Oceania'),
(16, 'Réunion', 'Africa'),
(17, 'Capo Verde', 'Africa'),
(18, 'Afghanistan', 'Asia'),
(19, 'Iran', 'Asia'),
(20, 'Russia', 'Europa/Asia'),
(21, 'Fiji', 'Oceania'),
(22, 'Laos', 'Asia'),
(23, 'Arabia Saudita', 'Asia'),
(24, 'Marocco', 'Africa'),
(25, 'Madagascar', 'Africa'),
(26, 'Nuova Zelanda', 'Oceania'),
(27, 'Filippine', 'Asia'),
(28, 'Cambogia', 'Asia'),
(29, 'Malesia', 'Asia');

SELECT * FROM Paesii ;

CREATE TABLE Dazii (
    id_daziio INT PRIMARY KEY,
    id_paese INT,  -- deve corrispondere al nome della colonna in Paesi
    dazio_percentuale DECIMAL(5,2),
    dazio_usa DECIMAL(5,2),
    FOREIGN KEY (id_paese) REFERENCES Paesii(id_paesii)
);

INSERT INTO Dazii (id_daziio, id_paese, dazio_percentuale, dazio_usa) VALUES
(1, 1, 20, 39),
(2, 2, 34, 67),
(3, 3, 24, 46),
(4, 4, 32, 64),
(5, 5, 26, 52),
(6, 6, 25, 50),
(7, 7, 31, 61),
(8, 8, 32, 64),
(9, 9, 11, 22),
(10, 10, 32, 63),
(11, 11, 10, 10),
(12, 12, 10, 10),
(13, 13, 10, 10),
(14, 14, 10, 10),
(15, 15, 29, 58),
(16, 16, 37, 73),
(17, 17, 10, 10),
(18, 18, 10, 49),
(19, 19, 10, 10),
(20, 20, 10, 10),
(21, 21, 32, 63),
(22, 22, 48, 95),
(23, 23, 10, 10),
(24, 24, 10, 10),
(25, 25, 47, 93),
(26, 26, 10, 20),
(27, 27, 17, 34),
(28, 28, 49, 97),
(29, 29, 24, 47);

SELECT * FROM Dazii;

CREATE TABLE Info_Paese (
    id_info INT PRIMARY KEY,
    id_paesei INT,
    note VARCHAR(255),
    FOREIGN KEY (id_paesei) REFERENCES Paesii(id_paesii)
);

INSERT INTO Info_Paese (id_info, id_paesei, note) VALUES
(1, 1, 'Unione di 27 paesi europei'),
(2, 2, 'Cina: grande esportatore globale'),
(3, 3, 'Giappone: economia tecnologica'),
(4, 4, 'Taiwan: chip semiconductor'),
(5, 5, 'India: mercato emergente'),
(6, 6, 'Corea del Sud: elettronica'),
(7, 7, 'Svizzera: finanza e orologi'),
(8, 8, 'Indonesia: materie prime'),
(9, 9, 'RDC: risorse minerarie'),
(10, 10, 'Angola: petrolio e diamanti'),
(11, 11, 'Australia: esportazioni agricole e minerarie'),
(12, 12, 'Canada: minerali e energia'),
(13, 13, 'Messico: industria manifatturiera'),
(14, 14, 'Argentina: agricoltura e carne'),
(15, 15, 'Isola Norfolk: piccolo territorio australiano'),
(16, 16, 'Réunion: dipartimento francese'),
(17, 17, 'Capo Verde: turismo e pesca'),
(18, 18, 'Afghanistan: economia instabile'),
(19, 19, 'Iran: petrolio e sanzioni'),
(20, 20, 'Russia: gas e petrolio'),
(21, 21, 'Fiji: turismo e zucchero'),
(22, 22, 'Laos: risorse naturali'),
(23, 23, 'Arabia Saudita: petrolio'),
(24, 24, 'Marocco: agricoltura e fosfati'),
(25, 25, 'Madagascar: agricoltura e minerali'),
(26, 26, 'Nuova Zelanda: lattiero-caseario'),
(27, 27, 'Filippine: elettronica e tessile'),
(28, 28, 'Cambogia: tessile e agricoltura'),
(29, 29, 'Malesia: elettronica e olio di palma');

SELECT * FROM Info_Paese;

-- Per SQL Server
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- Oppure semplicemente vedere i dati sono inseriti 
SELECT * FROM Paesii;
SELECT * FROM Dazii;
SELECT * FROM Info_Paese;

--INNER JOIN
SELECT 
    p.paesei,
    p.continentei,
    d.dazio_percentuale,
    d.dazio_usa,
    i.note
FROM Paesii AS p
INNER JOIN Dazii AS d ON p.id_paesii = d.id_paese
INNER JOIN Info_Paese AS i ON p.id_paesii = i.id_paesei;



SELECT 
    p.paesei,
    p.continentei,
    d.dazio_percentuale,
    d.dazio_usa,
    i.note
FROM Paesii AS p
LEFT JOIN Dazii AS d ON p.id_paesii = d.id_paese
LEFT JOIN Info_Paese AS i ON p.id_paesii = i.id_paesei;



--RIGHT JOIN

SELECT 
    p.paesei,
    p.continentei,
    d.dazio_percentuale,
    d.dazio_usa,
    i.note
FROM Paesii AS p
RIGHT JOIN Dazii AS d ON p.id_paesii = d.id_paese
RIGHT JOIN Info_Paese AS i ON p.id_paesii = i.id_paesei;

SELECT 
    p.paesei,
    p.continentei,
    d.dazio_percentuale,
    CASE
        WHEN d.dazio_percentuale >= 31 THEN 'Dazio Alto'
        WHEN d.dazio_percentuale BETWEEN 16 AND 30 THEN 'Dazio Medio'
        ELSE 'Dazio Basso'
    END AS Categoria_Dazio,
    i.note
FROM Paesii AS p
JOIN Dazii AS d ON p.id_paesii = d.id_paese
JOIN Info_Paese AS i ON p.id_paesii = i.id_paesei;
