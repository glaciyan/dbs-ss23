CREATE TABLE land
(
    id      NUMBER PRIMARY KEY, -- alle prim keys als constraint
    name     VARCHAR2(255) NOT NULL,
    iso_code VARCHAR2(2)   NOT NULL
);

CREATE TABLE ort
(
    id                    NUMBER PRIMARY KEY,
    land_id                NUMBER NOT NULL,
    naechsten_flughafen_id NUMBER NOT NULL,
    CONSTRAINT fk_org_land FOREIGN KEY (land_id) REFERENCES land (id)
);

CREATE TABLE adresse
(
    id        NUMBER PRIMARY KEY,
    strasse    VARCHAR2(255) NOT NULL,
    hausnummer VARCHAR2(10)  NOT NULL,
    plz        VARCHAR2(10)  NOT NULL,
    ort_id     NUMBER        NOT NULL,
    CONSTRAINT fk_adresse_ort FOREIGN KEY (ort_id) REFERENCES ort (id)
);

CREATE TABLE flughafen
(
    id        NUMBER PRIMARY KEY,
    name       VARCHAR2(255) NOT NULL,
    adresse_id NUMBER        NOT NULL,
    CONSTRAINT fk_flughaefen_adressen FOREIGN KEY (adresse_id) REFERENCES adresse (id)
);

-- droppen
ALTER TABLE ort ADD CONSTRAINT fk_org_flughafen FOREIGN KEY (naechsten_flughafen_id) REFERENCES flughafen (id);

CREATE TABLE kunden
(
    id           NUMBER PRIMARY KEY,
    name          VARCHAR2(255) NOT NULL,
    vorname       VARCHAR2(255) NOT NULL,
    geburtsdatum  DATE          NOT NULL,
    adresse_id    NUMBER        NOT NULL,
    telefonnummer VARCHAR2(20)  NOT NULL,
    email         VARCHAR2(255) NOT NULL UNIQUE,
    CONSTRAINT fk_kunden_adressen FOREIGN KEY (adresse_id) REFERENCES adresse (id)
);

CREATE TABLE bankverbindung
(
    id          NUMBER PRIMARY KEY,
    blz         VARCHAR2(8)  NOT NULL,
    kontonummer VARCHAR2(10) NOT NULL,
    iban        VARCHAR2(34) NOT NULL, -- uniqyue
    bic         VARCHAR2(11) NOT NULL,
    kunde_id    NUMBER       NOT NULL,
    CONSTRAINT fk_bankverbindungen_kunden FOREIGN KEY (kunde_id) REFERENCES kunden (id)
);

CREATE TABLE ferienwohnung
(
    id            NUMBER PRIMARY KEY,
    beschreibung  VARCHAR2(1000) NOT NULL,
    adresse_id    NUMBER         NOT NULL,
    zimmeranzahl  NUMBER         NOT NULL,
    groesse_qm    NUMBER         NOT NULL, -- check > 0
    preis_pro_tag NUMBER         NOT NULL,
    CONSTRAINT fk_ferienwohnungen_adressen FOREIGN KEY (adresse_id) REFERENCES adresse (id)
);

CREATE TABLE zusatzausstattung
(
    id               NUMBER PRIMARY KEY,
    ferienwohnung_id NUMBER        NOT NULL,
    ausstattung      VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_zusatzausstattungen_ferienwohnungen FOREIGN KEY (ferienwohnung_id) REFERENCES ferienwohnung (id)
);

CREATE TABLE bilder
(
    id               NUMBER PRIMARY KEY,
    ferienwohnung_id NUMBER        NOT NULL,
    bildbeschreibung VARCHAR2(255),
    dateipfad        VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_bilder_ferienwohnungen FOREIGN KEY (ferienwohnung_id) REFERENCES ferienwohnung (id)
);

CREATE TABLE touristenattraktion
(
    id           NUMBER PRIMARY KEY,
    name         VARCHAR2(255) NOT NULL,
    beschreibung VARCHAR2(1000),
    adresse_id   NUMBER        NOT NULL,
    CONSTRAINT fk_touristenattraktionen_adressen FOREIGN KEY (adresse_id) REFERENCES adresse (id)
);

CREATE TABLE belegung
(
    id               NUMBER PRIMARY KEY,
    kunde_id         NUMBER NOT NULL,
    ferienwohnung_id NUMBER NOT NULL,
    status_flag      VARCHAR2(10) CHECK (status_flag IN ('reserviert', 'gebucht')), -- named constraint
    startdatum       DATE   NOT NULL, -- check enddatem > startsdatum
    enddatum         DATE   NOT NULL,
    CONSTRAINT fk_belegungen_kunden FOREIGN KEY (kunde_id) REFERENCES kunden (id),
    CONSTRAINT fk_belegungen_ferienwohnungen FOREIGN KEY (ferienwohnung_id) REFERENCES ferienwohnung (id)
);

CREATE TABLE rechnung
(
    id                    NUMBER PRIMARY KEY,
    betrag                NUMBER NOT NULL,
    buchungsnummer        NUMBER NOT NULL,
    rechnungsdatum        DATE   NOT NULL,
    zahlungseingangsdatum DATE,
    belegung_id           NUMBER NOT NULL UNIQUE,
    CONSTRAINT fk_rechnungen_belegungen FOREIGN KEY (belegung_id) REFERENCES belegung (id)
);

CREATE TABLE ortsentfernung
(
    id            NUMBER PRIMARY KEY, -- start und end is primary key
    starting         NUMBER NOT NULL,
    ende          NUMBER NOT NULL,
    entfernung_km NUMBER NOT NULL, -- check
    CONSTRAINT fk_start_ort FOREIGN KEY (starting) REFERENCES ort (id),
    CONSTRAINT fk_ende_ort FOREIGN KEY (ende) REFERENCES ort (id)
);

CREATE TABLE fluggesellschaften
(
    id               NUMBER PRIMARY KEY,
    name             VARCHAR2(255) NOT NULL,
    servicequalitaet NUMBER CHECK (servicequalitaet BETWEEN 1 AND 10) -- named constraint
);

CREATE TABLE flugstrecken
(
    id                  NUMBER PRIMARY KEY, -- keine id start und ziel ist prim key
    start_flughafen_id  NUMBER NOT NULL,
    ziel_flughafen_id   NUMBER NOT NULL,
    fluggesellschaft_id NUMBER NOT NULL,
    CONSTRAINT fk_flugstrecken_start_flughafen FOREIGN KEY (start_flughafen_id) REFERENCES flughafen (id),
    CONSTRAINT fk_flugstrecken_ziel_flughafen FOREIGN KEY (ziel_flughafen_id) REFERENCES flughafen (id),
    CONSTRAINT fk_flugstrecken_fluggesellschaft FOREIGN KEY (fluggesellschaft_id) REFERENCES fluggesellschaften (id)
);

commit;

