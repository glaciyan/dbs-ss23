-- Welche Belegungen gibt es für eine gegebene Ferienwohnung?
SELECT *
FROM BELEGUNG
WHERE FERIENWOHNUNG_ID = ?;
-- z.b. 5

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
  AND STATUS_FLAG = 'reservierung';

-- Wie viele Buchungen haben Personen mit einem gegebenen Nachnamen getätigt? Dabei sollen nur Per-
-- sonen ausgegeben werden, die mindestens eine Buchung getätigt haben. Beachten Sie weiterhin, dass es
-- mehrere Personen mit dem gleichem Nachnamen geben kann.
SELECT DISTINCT K.VORNAME, K.NAME, (SELECT COUNT(*) FROM BELEGUNG WHERE K.KUNDENNUMMER = BELEGUNG.KUNDE_ID)
FROM BELEGUNG
         INNER JOIN KUNDE K on K.KUNDENNUMMER = BELEGUNG.KUNDE_ID
WHERE K.NAME = ?;
