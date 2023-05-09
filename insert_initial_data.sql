/* 
CREATE SEQUENCE id_seq
START WITH 1
INCREMENT BY 1
NOCACHE;
*/

INSERT INTO "LAND" (name, iso_code) VALUES ('Deutschland', 'DE');
INSERT INTO "LAND" (name, iso_code) VALUES ('Schweiz', 'CH');
INSERT INTO "LAND" (NAME, ISO_CODE) VALUES ('Türkei', 'TR');
INSERT INTO "LAND" (NAME, ISO_CODE) VALUES ('Frankreich', 'FR');
INSERT INTO "LAND" (NAME, ISO_CODE) VALUES ('Spanien', 'ES');
INSERT INTO "LAND" (NAME, ISO_CODE) VALUES ('Grönland', 'GL');

INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (1, 'Konstanz', 'DE', 'Frankfurt');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (2, 'Stuttgart', 'DE', 'Frankfurt');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (3, 'Heidelberg','DE', 'Frankfurt');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (4, 'Rust', 'DE', 'Frankfurt');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (5, 'Bern', 'CH', 'Zürich');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (6, 'Zürich', 'CH', 'Zürich');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (7, 'Chur', 'CH', 'Zürich');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (8, 'Flims-Laax', 'CH', 'Zürich');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (9, 'Öludeniz', 'TR', 'Istanbul');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (10, 'Antalya', 'TR', 'Istanbul');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (11, 'Bordeaux', 'FR', 'Paris');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (12, 'Paris', 'FR', 'Paris');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (13, 'Disneyland', 'FR', 'Paris');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (14, 'Barcelona', 'ES', 'Barcelona');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (15, 'Frankfurt', 'DE', 'Frankfurt');
INSERT INTO "ORT"(ORT_ID, ortsname, ISO_CODE, NAECHSTEN_FLUGHAFEN) VALUES (16, 'Istanbul', 'TR', 'Istanbul');

/*Adressen von Kunden*/
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (1,'Reutestr.',104, 78467, 1);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (2, 'Hauptstr.', 12, 69115, 2);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (3, 'Schlossstr.', 54, 70173, 3 );
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (4, 'Alpenstr.', 11, 3001, 4);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (5, 'Seeweg', 23, 8001, 5);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (6, 'Rheingutstr.', 14, 78462, 1);
/*Adressen von Flughafen*/
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (7, 'Am Flughafen.', 2, 60541, 15);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (8, 'Sabiha Gökcen', 1, 1452, 16);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (9, 'Flughafen-Allee', 100, 5098, 6);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (10, 'Charles de Gaulle', 1, 8792, 12);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (11, 'Aeropuerto de Barcelona', 10, 08820, 14);
/*Adressen von Touristenattraktionen*/
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (12, 'Europapark', 1, 78231, 4);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (13, 'Seestr.', 12, 78463, 1);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (14, 'Bergweg', 78, 2371, 8);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (15, 'GreenOne', 29, 1352, 6);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (16, 'rue de gaulle', 10, 8787, 13);
-- Aressen von Ferienwohnungen
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (17, 'Highway', '5', '2349', 9);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (18, 'Markgrafenstr.', '33', '78461', 1);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (19, 'Zur Piste', '189', '2234', 7);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (20, 'rue Monsieur', '980', '8234', 11);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (21, 'rue de gaulle', '22', '8787', 13);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (22, 'rue de la Maison Blanche', '32', '8792', 12);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (23, 'rue liberte', '78', '8792', 12);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (24, 'Strandweg', '90', '2321', 10);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (25, 'Strandweg', '91', '2321', 10);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (26, 'Calle del torro', '821', '5221', 14);
INSERT INTO ADRESSE (ADRESSE_ID, STRASSE, HAUSNUMMER, PLZ, ORT_ID) VALUES (27, 'Strandweg', '45', '2321', 10);


INSERT INTO "FLUGHAFEN"(name, adresse_id) VALUES ('Frankfurt', 7);
INSERT INTO "FLUGHAFEN"(name, adresse_id) VALUES ('Istanbul', 8);
INSERT INTO "FLUGHAFEN"(name, adresse_id) VALUES ('Zürich', 9);
INSERT INTO "FLUGHAFEN"(name, adresse_id) VALUES ('Paris', 10);
INSERT INTO "FLUGHAFEN"(name, adresse_id) VALUES ('Barcelona', 11);

INSERT INTO KUNDE (KUNDENNUMMER, NAME, VORNAME, GEBURTSDATUM, ADRESSE_ID, TELEFONNUMMER, EMAIL, BLZ, KONTONUMMER, IBAN,
                   BIC)
VALUES (1, 'Napf', 'Karl', TO_DATE('1.1.1960', 'DD.MM.YYYY'), 1, '07531-123456', 'knapf@gmx.de', '69271723', '7823212',
        'DE85692717230007823212', 'KARSDE66XXX');
INSERT INTO KUNDE (KUNDENNUMMER, NAME, VORNAME, GEBURTSDATUM, ADRESSE_ID, TELEFONNUMMER, EMAIL, BLZ, KONTONUMMER, IBAN,
                   BIC)
VALUES (2, 'Meier', 'Hans', TO_DATE('1.2.1975', 'DD.MM.YYYY'), 2, '06221-999888', 'meiers.hans@t-online.de', '32793968',
        '8929368', 'DE83692717230008929368', 'BARSDE77XXX');
INSERT INTO KUNDE (KUNDENNUMMER, NAME, VORNAME, GEBURTSDATUM, ADRESSE_ID, TELEFONNUMMER, EMAIL, BLZ, KONTONUMMER, IBAN,
                   BIC)
VALUES (3, 'Huber', 'Franz', TO_DATE('1.3.1980', 'DD.MM.YYYY'), 3, '0711-554673', 'huber@t-online.de', '69271723',
        '1347291', 'DE85692717230001347291', 'KARSDE66XXX');
INSERT INTO KUNDE (KUNDENNUMMER, NAME, VORNAME, GEBURTSDATUM, ADRESSE_ID, TELEFONNUMMER, EMAIL, BLZ, KONTONUMMER, IBAN,
                   BIC)
VALUES (4, 'Eber', 'Klaus', TO_DATE('1.4.1985', 'DD.MM.YYYY'), 4, '+41-171-9864785', 'eber@bluewin.ch', '29788431',
        '8792978', 'CH85692717230008792978', 'MEMECH88XXX');
INSERT INTO KUNDE (KUNDENNUMMER, NAME, VORNAME, GEBURTSDATUM, ADRESSE_ID, TELEFONNUMMER, EMAIL, BLZ, KONTONUMMER, IBAN,
                   BIC)
VALUES (5, 'Meier', 'Egon', TO_DATE('1.5.1990', 'DD.MM.YYYY'), 5, '+41-171-9864786', 'meier@gmail. com', '87890271',
        '9082780', 'CH85692717230009082780', 'KONSCH12XXX');
INSERT INTO KUNDE (KUNDENNUMMER, NAME, VORNAME, GEBURTSDATUM, ADRESSE_ID, TELEFONNUMMER, EMAIL, BLZ, KONTONUMMER, IBAN,
                   BIC)
VALUES (6, 'Knopf', 'Jim', TO_DATE('1.6.1995', 'DD.MM.YYYY'), 6, '0171-9876543', 'jim.knopf@gmx.net', '69271723',
        '7322890', 'DE85692717230007322890', 'KARSDE66XXX');


INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (1, 'Finka', 17, 6, 200, 349);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (2, 'Ferienwohnung mit Seeblick', 18, 2, 45, 120);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (3, 'im Schnee', 19, 3, 150, 249);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (4, 'direkt am Meer', 20, 4, 100, 249);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (5, 'direkt am Park', 21, 3, 110, 289);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (6, 'mit Blick auf Eiffelturm', 22, 2, 70, 549);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (7, 'Dachterrassewohnung zentral', 23, 6, 110, 159);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (8, 'zweigeschoessiges Haus', 24, 12, 200, 240);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (9, 'Topvilla am Strand', 25, 5, 111, 159);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (10, 'Ferienhaus am Strand', 26, 4, 100, 299);
INSERT INTO FERIENWOHNUNG (WOHNUNGSNUMMER, BESCHREIBUNG, ADRESSE_ID, ZIMMERANZAHL, GROESSE_QM, PREIS_PRO_TAG)
VALUES (11, 'Strandbungalow', 27, 4, 100, 150);


INSERT INTO ZUSATZAUSSTATTUNG (NAME) VALUES ('Schwimmbad');
INSERT INTO ZUSATZAUSSTATTUNG (NAME) VALUES ('Sauna');
INSERT INTO ZUSATZAUSSTATTUNG (NAME) VALUES ('Autoabstellplatz');
INSERT INTO ZUSATZAUSSTATTUNG (NAME) VALUES ('Aufzug');
INSERT INTO ZUSATZAUSSTATTUNG (NAME) VALUES ('Kinderbetreuung');
INSERT INTO ZUSATZAUSSTATTUNG (NAME) VALUES ('Sat-TV');
INSERT INTO ZUSATZAUSSTATTUNG (NAME) VALUES ('Reinigung');
INSERT INTO ZUSATZAUSSTATTUNG (NAME) VALUES ('Dachterrasse');
INSERT INTO ZUSATZAUSSTATTUNG (NAME) VALUES ('Garage');

INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Schwimmbad',1);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Sauna',1);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Aufzug',2);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Autoabstellplatz',2);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Sauna',3);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Kinderbetreuung',5);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Schwimmbad',5);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Schwimmbad',6);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Schwimmbad',7);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Sat-TV',8);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Reinigung',8);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Dachterrasse',8);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Garage',9);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Schwimmbad',9);
INSERT INTO FERIENWOHNUNG_ZUSATSAUSSTATTUNG (ZID, FID) VALUES ('Schwimmbad',11);

INSERT INTO BILD (BILD_ID, FERIENWOHNUNG_ID, BILDBESCHREIBUNG, DATEIPFAD) VALUES (1, 1, 'Aussenansicht', '1_1.jpg');
INSERT INTO BILD (BILD_ID, FERIENWOHNUNG_ID, BILDBESCHREIBUNG, DATEIPFAD) VALUES (2, 1, 'Innenansicht', '1_2.jpg');
INSERT INTO BILD (BILD_ID, FERIENWOHNUNG_ID, BILDBESCHREIBUNG, DATEIPFAD) VALUES (3, 2, 'Aussenansicht', '2_1.jpg');
INSERT INTO BILD (BILD_ID, FERIENWOHNUNG_ID, BILDBESCHREIBUNG, DATEIPFAD) VALUES (4, 2, 'Innenansicht', '2_2.jpg');
INSERT INTO BILD (BILD_ID, FERIENWOHNUNG_ID, BILDBESCHREIBUNG, DATEIPFAD) VALUES (5, 5, 'Garage', '5-1.gif');
INSERT INTO BILD (BILD_ID, FERIENWOHNUNG_ID, BILDBESCHREIBUNG, DATEIPFAD) VALUES (6, 8, 'Dachterrsasse', '8.jpg');

INSERT INTO "TOURISTENATTRAKTION"(name, art, beschreibung, adresse_id) VALUES ('Europapark', 'Freizeitpark', 'Deutschlands Nr. 1', 12 );
INSERT INTO "TOURISTENATTRAKTION"(name, art, beschreibung, adresse_id) VALUES ('Hoernie', 'Badestand', 'Bodensee-Strandbad', 13 );
INSERT INTO "TOURISTENATTRAKTION"(name, art, adresse_id) VALUES ('Flims-Laax Arena', 'Skigebiet', 14 );
INSERT INTO "TOURISTENATTRAKTION"(name, art, adresse_id) VALUES ('GreenOne', 'Golfplatz', 15 );
INSERT INTO "TOURISTENATTRAKTION"(name, art, adresse_id) VALUES ('Disneyland', 'Freizeitpark', 16 );

INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (1, 2, 4, 'buchung', TO_DATE('2016-03-11', 'YYYY-MM-DD'), TO_DATE('2016-03-13', 'YYYY-MM-DD'),
        TO_DATE('2016-02-12', 'YYYY-MM-DD'));
INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (2, 2, 5, 'reservierung', TO_DATE('2016-05-11', 'YYYY-MM-DD'), TO_DATE('2016-05-17', 'YYYY-MM-DD'),
        TO_DATE('2016-03-13', 'YYYY-MM-DD'));
INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (3, 3, 5, 'reservierung', TO_DATE('2016-04-03', 'YYYY-MM-DD'), TO_DATE('2016-04-23', 'YYYY-MM-DD'),
        TO_DATE('2016-02-10', 'YYYY-MM-DD'));
INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (4, 4, 6, 'buchung', TO_DATE('2016-07-04', 'YYYY-MM-DD'), TO_DATE('2016-07-05', 'YYYY-MM-DD'),
        TO_DATE('2016-02-09', 'YYYY-MM-DD'));
INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (5, 2, 10, 'reservierung', TO_DATE('2016-04-28', 'YYYY-MM-DD'), TO_DATE('2016-05-02', 'YYYY-MM-DD'),
        TO_DATE('2016-02-14', 'YYYY-MM-DD'));
INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (6, 3, 8, 'buchung', TO_DATE('2016-05-04', 'YYYY-MM-DD'), TO_DATE('2016-05-22', 'YYYY-MM-DD'),
        TO_DATE('2016-02-18', 'YYYY-MM-DD'));
INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (7, 1, 2, 'buchung', TO_DATE('2016-05-07', 'YYYY-MM-DD'), TO_DATE('2016-05-08', 'YYYY-MM-DD'),
        TO_DATE('2016-02-01', 'YYYY-MM-DD'));
INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (8, 5, 9, 'buchung', TO_DATE('2016-05-22', 'YYYY-MM-DD'), TO_DATE('2016-05-28', 'YYYY-MM-DD'),
        TO_DATE('2016-02-11', 'YYYY-MM-DD'));
INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (9, 5, 10, 'buchung', TO_DATE('2016-07-03', 'YYYY-MM-DD'), TO_DATE('2016-07-08', 'YYYY-MM-DD'),
        TO_DATE('2016-02-07', 'YYYY-MM-DD'));
INSERT INTO BELEGUNG(BELEBUNGSNUMMER, KUNDE_ID, FERIENWOHNUNG_ID, STATUS_FLAG, STARTDATUM, ENDDATUM, ERSTELLT_AM)
VALUES (10, 4, 1, 'reservierung', TO_DATE('2016-05-01', 'YYYY-MM-DD'), TO_DATE('2016-05-24', 'YYYY-MM-DD'),
        TO_DATE('2016-02-10', 'YYYY-MM-DD'));

INSERT INTO RECHNUNG(RECHNUNGSNUMMER, BETRAG, RECHNUNGSDATUM, ZAHLUNGSEINGANGSDATUM, BELEGUNG_ID)
VALUES (1, 498, TO_DATE('3/15/2016', 'MM/DD/YYYY'), TO_DATE('3/18/2016', 'MM/DD/YYYY'), 1);
INSERT INTO RECHNUNG(RECHNUNGSNUMMER, BETRAG, RECHNUNGSDATUM, ZAHLUNGSEINGANGSDATUM, BELEGUNG_ID)
VALUES (2, 549, TO_DATE('2/26/2016', 'MM/DD/YYYY'), NULL, 4);

INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (1, 'Lufthansa', 1);
INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (2, 'German Wings', 4);
INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (3, 'Thomas Cook', 8);
INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (4, 'Hapag Lloyd', 9);
INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (5, 'Swiss', 8);

INSERT INTO FLUGSTRECKE(START_FLUGHAFEN_NAME, ZIEL_FLUGHAFEN_NAME, fluggesellschaft_id) VALUES ('Frankfurt', 'Barcelona', 1);
INSERT INTO FLUGSTRECKE(START_FLUGHAFEN_NAME, ZIEL_FLUGHAFEN_NAME, fluggesellschaft_id) VALUES ('Frankfurt', 'Istanbul', 2);
INSERT INTO FLUGSTRECKE(START_FLUGHAFEN_NAME, ZIEL_FLUGHAFEN_NAME, fluggesellschaft_id) VALUES ('Frankfurt', 'Paris', 2);
INSERT INTO FLUGSTRECKE(START_FLUGHAFEN_NAME, ZIEL_FLUGHAFEN_NAME, fluggesellschaft_id) VALUES ('Frankfurt', 'Paris', 1);
INSERT INTO FLUGSTRECKE(START_FLUGHAFEN_NAME, ZIEL_FLUGHAFEN_NAME, fluggesellschaft_id) VALUES ('Frankfurt', 'Paris', 3);
INSERT INTO FLUGSTRECKE(START_FLUGHAFEN_NAME, ZIEL_FLUGHAFEN_NAME, fluggesellschaft_id) VALUES ('Istanbul', 'Barcelona', 1);
INSERT INTO FLUGSTRECKE(START_FLUGHAFEN_NAME, ZIEL_FLUGHAFEN_NAME, fluggesellschaft_id) VALUES ('Paris', 'Barcelona', 4);
INSERT INTO FLUGSTRECKE(START_FLUGHAFEN_NAME, ZIEL_FLUGHAFEN_NAME, fluggesellschaft_id) VALUES ('Paris', 'Zürich', 2);

INSERT INTO ADRESSEENTFERNUNG(START_ADRESSE, ZIEL_ADRESSE, ENTFERNUNG_KM)
VALUES (18, 13, 0);
INSERT INTO ADRESSEENTFERNUNG(START_ADRESSE, ZIEL_ADRESSE, ENTFERNUNG_KM)
VALUES (18, 12, 180);
INSERT INTO ADRESSEENTFERNUNG(START_ADRESSE, ZIEL_ADRESSE, ENTFERNUNG_KM)
VALUES (19, 15, 120);
INSERT INTO ADRESSEENTFERNUNG(START_ADRESSE, ZIEL_ADRESSE, ENTFERNUNG_KM)
VALUES (19, 14, 40);
INSERT INTO ADRESSEENTFERNUNG(START_ADRESSE, ZIEL_ADRESSE, ENTFERNUNG_KM)
VALUES (20, 16, 420);
INSERT INTO ADRESSEENTFERNUNG(START_ADRESSE, ZIEL_ADRESSE, ENTFERNUNG_KM)
VALUES (21, 16, 0);
INSERT INTO ADRESSEENTFERNUNG(START_ADRESSE, ZIEL_ADRESSE, ENTFERNUNG_KM)
VALUES (22, 16, 30);
INSERT INTO ADRESSEENTFERNUNG(START_ADRESSE, ZIEL_ADRESSE, ENTFERNUNG_KM)
VALUES (23, 16, 30);

commit;