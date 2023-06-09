-- 1) Welche Belegungen gibt es für eine gegebene Ferienwohnung?
SELECT *
FROM BELEGUNG
WHERE FERIENWOHNUNG_ID = ?;

-- 2) Welche Personen haben eine gegebene Ferienwohnung reserviert? Personen, die diese Ferienwohnung
-- mehrmals reserviert haben, sollen dabei nur einmal ausgegeben werden.
SELECT DISTINCT K.*
FROM BELEGUNG
         INNER JOIN KUNDE K on K.KUNDENNUMMER = BELEGUNG.KUNDE_ID
WHERE FERIENWOHNUNG_ID = ?
  AND BELEGUNG.STATUS_FLAG = 'reservierung';

-- 3) Wie viele Buchungen hat eine Person mit einer gegebenen Kundenummer getätigt?
SELECT COUNT(*) as Buchungen
FROM BELEGUNG
WHERE KUNDE_ID = ?
  AND STATUS_FLAG = 'buchung';

-- 4) Wie viele Buchungen haben Personen mit einem gegebenen Nachnamen getätigt? Dabei sollen nur Per-
-- sonen ausgegeben werden, die mindestens eine Buchung getätigt haben. Beachten Sie weiterhin, dass es
-- mehrere Personen mit dem gleichem Nachnamen geben kann.
SELECT DISTINCT K.VORNAME,
                K.NAME,
                (SELECT COUNT(*) FROM BELEGUNG WHERE K.KUNDENNUMMER = BELEGUNG.KUNDE_ID) as Anzahl
FROM BELEGUNG
         INNER JOIN KUNDE K on K.KUNDENNUMMER = BELEGUNG.KUNDE_ID
WHERE K.NAME = ?
  AND STATUS_FLAG = 'buchung';

-- 5) Welche Ferienwohnungen in Frankreich sind höchstens 100 km von (dem Ort) der Touristenattraktion
-- Disneyland entfernt?
SELECT F.WOHNUNGSNUMMER, T.NAME, ENTFERNUNG_KM
FROM ADRESSEENTFERNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = START_ADRESSE
         INNER JOIN ADRESSE A3 on A3.ADRESSE_ID = ZIEL_ADRESSE
         INNER JOIN FERIENWOHNUNG F on A2.ADRESSE_ID = F.ADRESSE_ID
         INNER JOIN TOURISTENATTRAKTION T on A3.ADRESSE_ID = T.ADRESSE_ID
         INNER JOIN ORT TORT on A2.ORT_ID = TORT.ORT_ID
WHERE TORT.ISO_CODE = 'FR'
  AND T.NAME = 'Disneyland'
  AND ENTFERNUNG_KM <= 100;

-- 6) Welche Ferienwohnungen mit Schwimmbad in Frankreich haben mindestens eine Reservierung bzw.
-- mindestens eine Buchung bzw. mindestens eine Belegung? (insgesamt 3 Anfragen)
-- 6a) Welche Ferienwohnungen mit Schwimmbad in Frankreich haben mindestens eine Reservierung?

SELECT FERIENWOHNUNG.WOHNUNGSNUMMER
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FERIENWOHNUNG_ZUSATSAUSSTATTUNG FZ on FERIENWOHNUNG.WOHNUNGSNUMMER = FZ.FID
         INNER JOIN ZUSATZAUSSTATTUNG Z on Z.NAME = FZ.ZID
         INNER JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
WHERE O.ISO_CODE = 'FR'
  AND Z.NAME = 'Schwimmbad'
  AND B.STATUS_FLAG = 'reservierung'
GROUP BY WOHNUNGSNUMMER
HAVING COUNT(B.BELEBUNGSNUMMER) > 0;

-- 6b) Welche Ferienwohnungen mit Schwimmbad in Frankreich haben mindestens eine Buchung?

SELECT FERIENWOHNUNG.WOHNUNGSNUMMER
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FERIENWOHNUNG_ZUSATSAUSSTATTUNG FZ on FERIENWOHNUNG.WOHNUNGSNUMMER = FZ.FID
         INNER JOIN ZUSATZAUSSTATTUNG Z on Z.NAME = FZ.ZID
         INNER JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
WHERE O.ISO_CODE = 'FR'
  AND Z.NAME = 'Schwimmbad'
  AND B.STATUS_FLAG = 'buchung'
GROUP BY WOHNUNGSNUMMER
HAVING COUNT(B.BELEBUNGSNUMMER) > 0;
--6c) Welche Ferienwohnungen mit Schwimmbad in Frankreich haben mindestens eine Belegung?

SELECT FERIENWOHNUNG.WOHNUNGSNUMMER
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FERIENWOHNUNG_ZUSATSAUSSTATTUNG FZ on FERIENWOHNUNG.WOHNUNGSNUMMER = FZ.FID
         INNER JOIN ZUSATZAUSSTATTUNG Z on Z.NAME = FZ.ZID
         INNER JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
WHERE O.ISO_CODE = 'FR'
  AND Z.NAME = 'Schwimmbad'
GROUP BY WOHNUNGSNUMMER
HAVING COUNT(B.BELEBUNGSNUMMER) > 0;

-- 7) Welche Ferienwohnungen mit Schwimmbad in Frankreich haben keine Reservierung bzw. keine Buchung bzw. keine Belegung? (insgesamt 3 Anfragen)

-- 7a) Ferienwohnungen mit Schwimmbad in Frankreich ohne Reservierung:
SELECT DISTINCT FERIENWOHNUNG.*
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FERIENWOHNUNG_ZUSATSAUSSTATTUNG FZ on FERIENWOHNUNG.WOHNUNGSNUMMER = FZ.FID
         INNER JOIN ZUSATZAUSSTATTUNG Z on Z.NAME = FZ.ZID
         LEFT JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
WHERE O.ISO_CODE = 'FR'
  AND Z.NAME = 'Schwimmbad'
  AND WOHNUNGSNUMMER NOT IN (SELECT WOHNUNGSNUMMER
                             FROM BELEGUNG BL,
                                  FERIENWOHNUNG F
                             WHERE F.WOHNUNGSNUMMER = BL.FERIENWOHNUNG_ID
                               AND B.STATUS_FLAG = 'reservierung');
--   AND (B.BELEBUNGSNUMMER IS NULL
--     OR B.STATUS_FLAG != 'reservierung');

-- 7b) Ferienwohnungen mit Schwimmbad in Frankreich ohne Buchung:
SELECT DISTINCT FERIENWOHNUNG.*
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FERIENWOHNUNG_ZUSATSAUSSTATTUNG FZ on FERIENWOHNUNG.WOHNUNGSNUMMER = FZ.FID
         INNER JOIN ZUSATZAUSSTATTUNG Z on Z.NAME = FZ.ZID
         LEFT JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
WHERE O.ISO_CODE = 'FR'
  AND Z.NAME = 'Schwimmbad'
  AND WOHNUNGSNUMMER NOT IN (SELECT WOHNUNGSNUMMER
                             FROM BELEGUNG BL,
                                  FERIENWOHNUNG F
                             WHERE F.WOHNUNGSNUMMER = BL.FERIENWOHNUNG_ID
                               AND BL.STATUS_FLAG = 'buchung');

-- 7c) Ferienwohnungen mit Schwimmbad in Frankreich ohne Belegung:
SELECT DISTINCT FERIENWOHNUNG.*
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FERIENWOHNUNG_ZUSATSAUSSTATTUNG FZ on FERIENWOHNUNG.WOHNUNGSNUMMER = FZ.FID
         INNER JOIN ZUSATZAUSSTATTUNG Z on Z.NAME = FZ.ZID
         LEFT JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
WHERE O.ISO_CODE = 'FR'
  AND Z.NAME = 'Schwimmbad'
  AND WOHNUNGSNUMMER NOT IN (SELECT WOHNUNGSNUMMER
                             FROM BELEGUNG BL,
                                  FERIENWOHNUNG F
                             WHERE F.WOHNUNGSNUMMER = BL.FERIENWOHNUNG_ID);

-- 8) Welche Ferienwohnungen mit Schwimmbad sind in der Türkei in der Zeit vom 01.05.2016 - 21.05.2016
-- bereits belegt (d.h. gebucht oder reserviert)?
SELECT *
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FERIENWOHNUNG_ZUSATSAUSSTATTUNG FZ on FERIENWOHNUNG.WOHNUNGSNUMMER = FZ.FID
         INNER JOIN ZUSATZAUSSTATTUNG Z on Z.NAME = FZ.ZID
         INNER JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
WHERE O.ISO_CODE = 'TR'
  AND Z.NAME = 'Schwimmbad'
  AND ((STARTDATUM <= TO_DATE('21.05.2016', 'DD.MM.YYYY') AND ENDDATUM >= TO_DATE('01.05.2016', 'DD.MM.YYYY'))
    OR (STARTDATUM >= TO_DATE('01.05.2016', 'DD.MM.YYYY') AND ENDDATUM <= TO_DATE('21.05.2016', 'DD.MM.YYYY'))
    OR (STARTDATUM <= TO_DATE('01.05.2016', 'DD.MM.YYYY') AND ENDDATUM >= TO_DATE('21.05.2016', 'DD.MM.YYYY')));

-- 9) Welche Ferienwohnungen mit Schwimmbad sind in der Türkei in der Zeit vom 01.05.2016 - 21.05.2016
--noch frei (d.h. nicht gebucht und nicht reserviert)?
SELECT *
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FERIENWOHNUNG_ZUSATSAUSSTATTUNG FZ on FERIENWOHNUNG.WOHNUNGSNUMMER = FZ.FID
         INNER JOIN ZUSATZAUSSTATTUNG Z on Z.NAME = FZ.ZID
         LEFT JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
WHERE O.ISO_CODE = 'TR'
  AND Z.NAME = 'Schwimmbad'
  AND (NOT ((STARTDATUM <= TO_DATE('21.05.2016', 'DD.MM.YYYY') AND ENDDATUM >= TO_DATE('01.05.2016', 'DD.MM.YYYY'))
    OR (STARTDATUM >= TO_DATE('01.05.2016', 'DD.MM.YYYY') AND ENDDATUM <= TO_DATE('21.05.2016', 'DD.MM.YYYY'))
    OR (STARTDATUM <= TO_DATE('01.05.2016', 'DD.MM.YYYY') AND ENDDATUM >= TO_DATE('21.05.2016', 'DD.MM.YYYY')))
    OR B.BELEBUNGSNUMMER IS NULL);

-- 10. Wie viele Belegungen von Ferienwohnungen gibt es für die einzelnen Länder in der Datenbank? (bitte
-- auch Länder ausgeben, die keine Belegungen haben bzw. die keine Orte / Adressen zugeordnet haben)
-- z.b. 10 belegungen Deutschland
SELECT LAND.NAME, COUNT(B.BELEBUNGSNUMMER)
FROM LAND
         LEFT JOIN ORT O on LAND.ISO_CODE = O.ISO_CODE
         LEFT JOIN ADRESSE A2 on O.ORT_ID = A2.ORT_ID
         LEFT JOIN FERIENWOHNUNG F on A2.ADRESSE_ID = F.ADRESSE_ID
         LEFT JOIN BELEGUNG B on F.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
GROUP BY LAND.NAME;

-- 11. Wie viele Reservierungen und Buchungen gibt es für die einzelnen Ferienwohnungen? (1 Anfrage; bitte
-- auch Ferienwohnungen ausgeben, die keine Reservierungen / Buchungen haben)
SELECT FERIENWOHNUNG.WOHNUNGSNUMMER,
       SUM(CASE WHEN B.STATUS_FLAG = 'reservierung' THEN 1 ELSE 0 END) AS Reversierungen,
       SUM(CASE WHEN B.STATUS_FLAG = 'buchung' THEN 1 ELSE 0 END)      AS Buchungen
FROM FERIENWOHNUNG
         LEFT JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
GROUP BY FERIENWOHNUNG.WOHNUNGSNUMMER;

-- 12. Welche Ferienwohnungen in Frankreich haben mehr Belegungen als es Ferienwohnungen in Deutschland gibt?
SELECT FERIENWOHNUNG.WOHNUNGSNUMMER
FROM FERIENWOHNUNG
         INNER JOIN BELEGUNG B on FERIENWOHNUNG.WOHNUNGSNUMMER = B.FERIENWOHNUNG_ID
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
WHERE O.ISO_CODE = 'FR'
GROUP BY FERIENWOHNUNG.WOHNUNGSNUMMER
HAVING COUNT(B.BELEBUNGSNUMMER) > (SELECT COUNT(*)
                                   FROM FERIENWOHNUNG
                                            INNER JOIN ADRESSE A3 on A3.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
                                            INNER JOIN ORT O2 on O2.ORT_ID = A3.ORT_ID
                                   WHERE O2.ISO_CODE = 'DE');

-- 13. Welches sind die "geeigneten" Fluggesellschaften für eine gegebene Ferienwohnung, mit denen man die
-- Ferienwohnung vom Ausland aus direkt erreichen kann? ("geeignet" = Fluggesellschaften, die den Flughafen anfliegen, der dem Ort der Ferienwohnung zugeordnet ist)
SELECT FG.*
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FLUGHAFEN F on F.NAME = O.NAECHSTEN_FLUGHAFEN
         INNER JOIN FLUGSTRECKE FS on F.NAME = FS.ZIEL_FLUGHAFEN_NAME
         INNER JOIN FLUGGESELLSCHAFTEN FG on FS.FLUGGESELLSCHAFT_ID = FG.ID

         INNER JOIN FLUGHAFEN AUSF on AUSF.NAME = FS.START_FLUGHAFEN_NAME
         INNER JOIN ADRESSE AUSA on AUSF.ADRESSE_ID = AUSA.ADRESSE_ID
         INNER JOIN ORT AUSO on AUSA.ORT_ID = AUSO.ORT_ID
WHERE WOHNUNGSNUMMER = ?
  AND AUSO.ISO_CODE != O.ISO_CODE;


-- 14. Welche Fluggesellschaft davon (siehe Anfrage 13) hat die beste Service-Qualität?
SELECT FG.*
FROM FERIENWOHNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = FERIENWOHNUNG.ADRESSE_ID
         INNER JOIN ORT O on O.ORT_ID = A2.ORT_ID
         INNER JOIN FLUGHAFEN F on F.NAME = O.NAECHSTEN_FLUGHAFEN
         INNER JOIN FLUGSTRECKE FS on F.NAME = FS.ZIEL_FLUGHAFEN_NAME
         INNER JOIN FLUGGESELLSCHAFTEN FG on FS.FLUGGESELLSCHAFT_ID = FG.ID

         INNER JOIN FLUGHAFEN AUSF on AUSF.NAME = FS.START_FLUGHAFEN_NAME
         INNER JOIN ADRESSE AUSA on AUSF.ADRESSE_ID = AUSA.ADRESSE_ID
         INNER JOIN ORT AUSO on AUSA.ORT_ID = AUSO.ORT_ID
WHERE WOHNUNGSNUMMER = ?
  AND AUSO.ISO_CODE != O.ISO_CODE
ORDER BY SERVICEQUALITAET DESC
    FETCH FIRST ROW ONLY;

