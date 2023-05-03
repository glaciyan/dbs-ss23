/* 
CREATE SEQUENCE id_seq
START WITH 1
INCREMENT BY 1
NOCACHE;
*/

INSERT INTO "LAND" (name, iso_code) VALUES ('Deutschland', 'DE');
INSERT INTO "LAND" (name, iso_code) VALUES ('Schweiz', 'CH');
INSERT INTO "LAND" (NAME, ISO_CODE) VALUES ('Türkei', 'RT');
INSERT INTO "LAND" (NAME, ISO_CODE) VALUES ('Frankreich', 'FR');
INSERT INTO "LAND" (NAME, ISO_CODE) VALUES ('Spanien', 'ES');
INSERT INTO "LAND" (NAME, ISO_CODE) VALUES ('Grönland', 'GL');

INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (1, 'Konstanz', 'DE', 'Frankfurt');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) (2, 'Heidelberg','DE', 'Frankfurt');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (3, 'Stuttgart', 'DE', 'Frankfurt');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (4, 'Rust', 'DE', 'Frankfurt');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (5, 'Bern', 'CH', 'Zürich' );
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (6, 'Zürich', 'CH', 'Zürich');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (7, 'Chur', 'CH', 'Zürich' );
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (8, 'Flims-Laax', 'CH', 'Zürich');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (9, 'Öludeniz', 'TR', 'Istanbul');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (10, 'Antalya', 'TR', 'Istanbul');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (11, 'Bordeaux', 'FR', 'Paris');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (12, 'Paris', 'FR', 'Paris');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (13, 'Disneyland', 'FR', 'Paris');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (14, 'Barcelona', 'ES', 'Barcelona');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (15, 'Frankfurt', 'DE', 'Frankfurt');
INSERT INTO "ORT"(ort_id, ortsname, land_id, naechsten_flughafen_id) VALUES (16, 'Istanbul', 'TR', 'Istanbul');

    
/*Adressen von Kunden*/
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (1,'Reutestr.',104, 78467, 1);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (2, 'Hauptstr.', 12, 69115, 2);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (3, 'Schlossstr.', 54, 70173, 3 );
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (4, 'Alpenstr.', 11, 3001, 4);
INSERT INTO "ADRESSE"(adresse_id, strasse, hausnummer, plz, ort_id) VALUES (5, 'Seeweg, 23', 8001, 5);
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

INSERT INTO "FLUGHAFEN"(flughafen_id, name, adresse_id) VALUES (1, 'Frankfurt', 7);
INSERT INTO "FLUGHAFEN"(flughafen_id, name, adresse_id) VALUES (2, 'Istanbul', 8);
INSERT INTO "FLUGHAFEN"(flughafen_id, name, adresse_id) VALUES (3, 'Zürich', 9);
INSERT INTO "FLUGHAFEN"(flughafen_id, name, adresse_id) VALUES (4, 'Paris', 10);
INSERT INTO "FLUGHAFEN"(flughafen_id, name, adresse_id) VALUES (5, 'Bacelona', 11);

INSERT INTO "KUNDE"(kundennummer, name, vorname, geburtsdatum, adresse_id, telefonnummer, email, blz, kontonummer, iban, bic)
    VALUES (1, 'Napf', 'Karl', 01.01.1960, 1, '07531-123456', 'knapf@gmx.de', '7823212', '69271723', 'DE85692717230007823212', 'KARSDE66XXX');
INSERT INTO "KUNDE"(kundennummer, name, vorname, geburtsdatum, adresse_id, telefonnummer, email, blz, kontonummer, iban, bic)
    VALUES (2, 'Meier', 'Hans',	02.01.1975, 2, '06221-999888', 'meiers.hans@t-online.de', '8929368', '32793968', 'DE83692717230008929368', 'BARSDE77XXX');
INSERT INTO "KUNDE"(kundennummer, name, vorname, geburtsdatum, adresse_id, telefonnummer, email, blz, kontonummer, iban, bic)
    VALUES (3, 'Huber', 'Franz', 03.01.1980, 3, '0711-554673', 'huber@t-online.de',	'1347291', '69271723', 'DE85692717230001347291', 'KARSDE66XXX');
INSERT INTO "KUNDE"(kundennummer, name, vorname, geburtsdatum, adresse_id, telefonnummer, email, blz, kontonummer, iban, bic)
    VALUES (4, 'Eber', 'Klaus', 04.01.1985,	4, '+41-171-9864785', 'eber@bluewin.ch', '8792978', '29788431',	'CH85692717230008792978', 'MEMECH88XXX');
INSERT INTO "KUNDE"(kundennummer, name, vorname, geburtsdatum, adresse_id, telefonnummer, email, blz, kontonummer, iban, bic)
    VALUES (5, 'Meier', 'Egon',	05.01.1990,	5, '+41-171-9864786', 'meier@gmail.com', '9082780', '87890271',	'CH85692717230009082780', 'KONSCH12XXX');
INSERT INTO "KUNDE"(kundennummer, name, vorname, geburtsdatum, adresse_id, telefonnummer, email, blz, kontonummer, iban, bic)
    VALUES (6, 'Knopf', 'Jim', 06.01.1995, 6, '0171-9876543', 'jim.knopf@gmx.net', '7322890', '69271723', 'DE85692717230007322890', 'KARSDE66XXX');

INSERT INTO "Ferenwohung"(id, beschreibung, adresse_id, zimmeranzahl, groesse_qm, preis_pro_tag)
    VALUES ();

INSERT INTO "zusatzausstattung"(id, ferienwohnung_id, ausstattung)
    VALUES ();
       
INSERT INTO "bild"(id, ferienwohnung_id, bildbeschreibung, dateipfad)
    VALUES ();

INSERT INTO "TOURISTENATTRAKTION"(id, name, art, beschreibung, adresse_id) VALUES (1, 'Europapark', 'Freizeitpark', 'Deutschlands Nr. 1', 12 );
INSERT INTO "TOURISTENATTRAKTION"(id, name, art, beschreibung, adresse_id) VALUES (2, 'Hoernie', 'Badestand', 'Bodensee-Strandbad', 13 );
INSERT INTO "TOURISTENATTRAKTION"(id, name, art, adresse_id) VALUES (3, 'Flims-Laax Arena', 'Skigebiet', 14 );
INSERT INTO "TOURISTENATTRAKTION"(id, name, art, adresse_id) VALUES (4, 'GreenOne', 'Golfplatz', 15 );
INSERT INTO "TOURISTENATTRAKTION"(id, name, art, adresse_id) VALUES (5, 'Disneyland', 'Freizeitpark', 16 );
  
INSERT INTO "belegung"(id, kunde_id, ferienwohnung_id, status_flag, startdatum, enddatum)
    VALUES ();

INSERT INTO "rechnung"(id, betrag, buchungsnummer, rechnungsdatum, zahlungseingangsdatum, belegung_id)
    VALUES ();

INSERT INTO "ortsentfernung"(id, starting, ende, entfernung_km)
    VALUES ();
    
INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (1, 'Lufthansa', 1);
INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (2, 'German Wings', 4);
INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (3, 'Thomas Cook', 8);
INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (4, 'Hapag Lloyd', 9);
INSERT INTO "FLUGGESELLSCHAFTEN"(id, name, servicequalitaet) VALUES (5, 'Swiss', 8);

INSERT INTO "FLUGSTRECKEN"(id, start_flughafen_id, ziel_flughafen_id, fluggesellschaft_id) VALUES (1, 'Frankfurt', 'Barcelona', 1);
INSERT INTO "FLUGSTRECKEN"(id, start_flughafen_id, ziel_flughafen_id, fluggesellschaft_id) VALUES (2, 'Frankfurt', 'Istanbul', 2);
INSERT INTO "FLUGSTRECKEN"(id, start_flughafen_id, ziel_flughafen_id, fluggesellschaft_id) VALUES (3, 'Frankfurt', 'Paris', 2);
INSERT INTO "FLUGSTRECKEN"(id, start_flughafen_id, ziel_flughafen_id, fluggesellschaft_id) VALUES (4, 'Frankfurt', 'Paris', 1);
INSERT INTO "FLUGSTRECKEN"(id, start_flughafen_id, ziel_flughafen_id, fluggesellschaft_id) VALUES (5, 'Frankfurt', 'Paris', 3);
INSERT INTO "FLUGSTRECKEN"(id, start_flughafen_id, ziel_flughafen_id, fluggesellschaft_id) VALUES (6, 'Istanbul', 'Barcelona', 1);
INSERT INTO "FLUGSTRECKEN"(id, start_flughafen_id, ziel_flughafen_id, fluggesellschaft_id) VALUES (7, 'Paris', 'Barcelona', 4);
INSERT INTO "FLUGSTRECKEN"(id, start_flughafen_id, ziel_flughafen_id, fluggesellschaft_id) VALUES (8, 'Paris', 'Zürich', 2);

/*hier habe ichs mir leicht gemacht und ne neue Tabelle erstellt
eventuell muss man in den gegebenen Tabellen den Ort für die FeWo und Attr. raussuchen und das dann mit der entfernung in der "ortsentfernung" tabelle eintragen*/
INSERT INTO "FeWoAttrEntf"(WohungsNr, AttraktionsName, entfernung_km) VALUES (2, 'Hoernle', 0);
INSERT INTO "FeWoAttrEntf"(WohungsNr, AttraktionsName, entfernung_km) VALUES (2, 'Europapark', 180);
INSERT INTO "FeWoAttrEntf"(WohungsNr, AttraktionsName, entfernung_km) VALUES (3, 'GreenOne', 120);
INSERT INTO "FeWoAttrEntf"(WohungsNr, AttraktionsName, entfernung_km) VALUES (3, 'Flims-Laax Arena', 40);
INSERT INTO "FeWoAttrEntf"(WohungsNr, AttraktionsName, entfernung_km) VALUES (4, 'Disneyland', 420);
INSERT INTO "FeWoAttrEntf"(WohungsNr, AttraktionsName, entfernung_km) VALUES (5, 'Disneyland', 0);
INSERT INTO "FeWoAttrEntf"(WohungsNr, AttraktionsName, entfernung_km) VALUES (6, 'Disneyland', 30);
INSERT INTO "FeWoAttrEntf"(WohungsNr, AttraktionsName, entfernung_km) VALUES (7, 'Disneyland', 30);

commit;