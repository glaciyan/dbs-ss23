delete
from ADRESSEENTFERNUNG
/

delete
from BILD
/

delete
from TOURISTENATTRAKTION
/

delete
from RECHNUNG
/

delete
from BELEGUNG
/

delete
from KUNDE
/

delete
from ORTSENTFERNUNG
/

delete
from FLUGSTRECKE
/

delete
from FLUGGESELLSCHAFTEN
/

delete
from FERIENWOHNUNG_ZUSATSAUSSTATTUNG
/

delete
from FERIENWOHNUNG
/

delete
from ZUSATZAUSSTATTUNG
/

-- Cyclic dependencies found

alter table ORT
    drop constraint FK_ORT_FLUGHAFEN
/

alter table flughafen
    drop constraint fk_flughafen_adresse
/

delete
from ADRESSE
/

delete
from ORT
/

delete
from LAND
/

delete
from FLUGHAFEN
/

ALTER TABLE ort
    ADD CONSTRAINT fk_ort_flughafen FOREIGN KEY (naechsten_flughafen) REFERENCES flughafen (name);
ALTER TABLE flughafen
    ADD CONSTRAINT fk_flughafen_adresse FOREIGN KEY (adresse_id) REFERENCES adresse (adresse_id);


commit;
