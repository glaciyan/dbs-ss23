-- Welche Belegungen gibt es für eine gegebene Ferienwohnung?
SELECT *
FROM BELEGUNG
WHERE FERIENWOHNUNG_ID = ?;

-- Welche Personen haben eine gegebene Ferienwohnung reserviert? Personen, die diese Ferienwohnung
-- mehrmals reserviert haben, sollen dabei nur einmal ausgegeben werden.
SELECT DISTINCT K.*
FROM BELEGUNG
         INNER JOIN KUNDE K on K.KUNDENNUMMER = BELEGUNG.KUNDE_ID
WHERE FERIENWOHNUNG_ID = ?
  AND BELEGUNG.STATUS_FLAG = 'reservierung';

-- Wie viele Buchungen hat eine Person mit einer gegebenen Kundenummer getätigt?
SELECT COUNT(*)
FROM BELEGUNG
WHERE KUNDE_ID = ?
  AND STATUS_FLAG = 'buchung';

-- Wie viele Buchungen haben Personen mit einem gegebenen Nachnamen getätigt? Dabei sollen nur Per-
-- sonen ausgegeben werden, die mindestens eine Buchung getätigt haben. Beachten Sie weiterhin, dass es
-- mehrere Personen mit dem gleichem Nachnamen geben kann.
SELECT DISTINCT K.VORNAME, K.NAME, (SELECT COUNT(*) FROM BELEGUNG WHERE K.KUNDENNUMMER = BELEGUNG.KUNDE_ID)
FROM BELEGUNG
         INNER JOIN KUNDE K on K.KUNDENNUMMER = BELEGUNG.KUNDE_ID
WHERE K.NAME = ? AND STATUS_FLAG = 'buchung';

-- Welche Ferienwohnungen in Frankreich sind höchstens 100 km von (dem Ort) der Touristenattraktion
-- Disneyland entfernt?
SELECT F.*, T.NAME, ENTFERNUNG_KM
FROM ADRESSEENTFERNUNG
         INNER JOIN ADRESSE A2 on A2.ADRESSE_ID = START_ADRESSE
         INNER JOIN ADRESSE A3 on A3.ADRESSE_ID = ZIEL_ADRESSE
         INNER JOIN FERIENWOHNUNG F on A2.ADRESSE_ID = F.ADRESSE_ID
         INNER JOIN TOURISTENATTRAKTION T on A3.ADRESSE_ID = T.ADRESSE_ID
         INNER JOIN ORT TORT on A2.ORT_ID = TORT.ORT_ID
WHERE TORT.ISO_CODE = 'FR'
  AND ENTFERNUNG_KM <= 100;
