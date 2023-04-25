CREATE TABLE land
(
    id       NUMBER,
    name     VARCHAR2(255) NOT NULL,
    iso_code VARCHAR2(2)   NOT NULL,
    CONSTRAINT pk_land PRIMARY KEY (id)
);

CREATE TABLE ort
(
    id                     NUMBER,
    land_id                NUMBER NOT NULL,
    naechsten_flughafen_id NUMBER NOT NULL,
    CONSTRAINT fk_org_land FOREIGN KEY (land_id) REFERENCES land (id),
    CONSTRAINT pk_ort PRIMARY KEY (id)
);

CREATE TABLE adresse
(
    id         NUMBER,
    strasse    VARCHAR2(255) NOT NULL,
    hausnummer VARCHAR2(10)  NOT NULL,
    plz        VARCHAR2(10)  NOT NULL,
    ort_id     NUMBER        NOT NULL,
    CONSTRAINT fk_adresse_ort FOREIGN KEY (ort_id) REFERENCES ort (id),
    CONSTRAINT pk_addresse PRIMARY KEY (id),
    CONSTRAINT uq_ort UNIQUE (ort_id)
);

CREATE TABLE flughafen
(
    id         NUMBER,
    name       VARCHAR2(255) NOT NULL,
    adresse_id NUMBER        NOT NULL,
    CONSTRAINT fk_flughaefen_adressen FOREIGN KEY (adresse_id) REFERENCES adresse (id),
    CONSTRAINT uq_flughafen_adresse UNIQUE (adresse_id),
    CONSTRAINT pk_flughafen PRIMARY KEY (id)
);

ALTER TABLE ort
    ADD CONSTRAINT fk_org_flughafen FOREIGN KEY (naechsten_flughafen_id) REFERENCES flughafen (id);

CREATE TABLE kunde
(
    id            NUMBER,
    name          VARCHAR2(255) NOT NULL,
    vorname       VARCHAR2(255) NOT NULL,
    geburtsdatum  DATE          NOT NULL,
    adresse_id    NUMBER        NOT NULL,
    telefonnummer VARCHAR2(20)  NOT NULL,
    email         VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_kunden_adressen FOREIGN KEY (adresse_id) REFERENCES adresse (id),
    CONSTRAINT pk_kunde PRIMARY KEY (id),
    CONSTRAINT uq_kunde_email UNIQUE (email),
    CONSTRAINT uq_kunde_adresse UNIQUE (adresse_id)
);

CREATE TABLE bankverbindung
(
    id          NUMBER,
    blz         VARCHAR2(8)  NOT NULL,
    kontonummer VARCHAR2(10) NOT NULL,
    iban        VARCHAR2(34) NOT NULL,
    bic         VARCHAR2(11) NOT NULL,
    kunde_id    NUMBER       NOT NULL,
    CONSTRAINT fk_bankverbindungen_kunden FOREIGN KEY (kunde_id) REFERENCES kunde (id),
    CONSTRAINT pk_bankverbindung PRIMARY KEY (id),
    CONSTRAINT uq_bankverbindung_iban UNIQUE (iban),
    CONSTRAINT uq_bankverbindung_kunde UNIQUE (kunde_id)
);

CREATE TABLE ferienwohnung
(
    id            NUMBER,
    beschreibung  VARCHAR2(1000) NOT NULL,
    adresse_id    NUMBER         NOT NULL,
    zimmeranzahl  NUMBER         NOT NULL,
    groesse_qm    NUMBER         NOT NULL,
    preis_pro_tag NUMBER         NOT NULL,
    CONSTRAINT fk_ferienwohnungen_adressen FOREIGN KEY (adresse_id) REFERENCES adresse (id),
    CONSTRAINT pk_ferienwohnung PRIMARY KEY (id),
    CONSTRAINT ferienwohnung_check_groesse_qm CHECK ( groesse_qm > 0 ),
    CONSTRAINT ferienwohnung_check_preis_pro_tag CHECK ( preis_pro_tag > 0 ),
    CONSTRAINT ferienwohnung_check_zimmeranzahl CHECK ( zimmeranzahl > 0 ),
    CONSTRAINT uq_ferienwohnung_adresse UNIQUE (adresse_id)
);

CREATE TABLE zusatzausstattung
(
    id               NUMBER,
    ferienwohnung_id NUMBER        NOT NULL,
    ausstattung      VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_zusatzausstattungen_ferienwohnungen FOREIGN KEY (ferienwohnung_id) REFERENCES ferienwohnung (id),
    CONSTRAINT pk_zusatzausstattung PRIMARY KEY (id)
);

CREATE TABLE bild
(
    id               NUMBER,
    ferienwohnung_id NUMBER        NOT NULL,
    bildbeschreibung VARCHAR2(255),
    dateipfad        VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_bilder_ferienwohnungen FOREIGN KEY (ferienwohnung_id) REFERENCES ferienwohnung (id),
    CONSTRAINT pk_bild PRIMARY KEY (id)
);

CREATE TABLE touristenattraktion
(
    id           NUMBER,
    name         VARCHAR2(255) NOT NULL,
    beschreibung VARCHAR2(1000),
    adresse_id   NUMBER        NOT NULL,
    CONSTRAINT fk_touristenattraktionen_adressen FOREIGN KEY (adresse_id) REFERENCES adresse (id),
    CONSTRAINT pk_touristenattraktion PRIMARY KEY (id),
    CONSTRAINT uq_touristenattraktion_adresse UNIQUE (adresse_id)
);

CREATE TABLE belegung
(
    id               NUMBER,
    kunde_id         NUMBER NOT NULL,
    ferienwohnung_id NUMBER NOT NULL,
    status_flag      VARCHAR2(10),
    startdatum       DATE   NOT NULL,
    enddatum         DATE   NOT NULL,
    CONSTRAINT pk_belungen PRIMARY KEY (id),
    CONSTRAINT fk_belegungen_kunden FOREIGN KEY (kunde_id) REFERENCES kunde (id),
    CONSTRAINT fk_belegungen_ferienwohnungen FOREIGN KEY (ferienwohnung_id) REFERENCES ferienwohnung (id),
    CONSTRAINT belegung_check_status_flash CHECK ( status_flag IN ('reserviert', 'gebucht')),
    CONSTRAINT belegung_check_start_grater_end CHECK (startdatum > enddatum)
);

CREATE TABLE rechnung
(
    id                    NUMBER,
    betrag                NUMBER NOT NULL,
    buchungsnummer        NUMBER NOT NULL,
    rechnungsdatum        DATE   NOT NULL,
    zahlungseingangsdatum DATE,
    belegung_id           NUMBER NOT NULL,
    CONSTRAINT fk_rechnungen_belegungen FOREIGN KEY (belegung_id) REFERENCES belegung (id),
    CONSTRAINT pk_rechnung PRIMARY KEY (id),
    CONSTRAINT rechnung_check_betrag CHECK ( betrag > 0 ),
    CONSTRAINT uq_rechnung_belegund UNIQUE (belegung_id)
);

CREATE TABLE ortsentfernung
(
    start_ort      NUMBER NOT NULL,
    ziel_ort          NUMBER NOT NULL,
    entfernung_km NUMBER NOT NULL,
    CONSTRAINT fk_start_ort FOREIGN KEY (start_ort) REFERENCES ort (id),
    CONSTRAINT fk_ende_ort FOREIGN KEY (ziel_ort) REFERENCES ort (id),
    CONSTRAINT pk_ortsentfernung PRIMARY KEY (start_ort, ziel_ort),
    CONSTRAINT ortsentfernung_check_entfernung_km CHECK ( entfernung_km > 0 )
);

CREATE TABLE fluggesellschaften
(
    id               NUMBER,
    name             VARCHAR2(255) NOT NULL,
    servicequalitaet NUMBER,
    CONSTRAINT pk_fluggesellschaften PRIMARY KEY (id),
    CONSTRAINT fluggesellschaften_check_servicequaliteat CHECK (servicequalitaet BETWEEN 1 AND 10)
);

CREATE TABLE flugstrecke
(
    start_flughafen_id  NUMBER NOT NULL,
    ziel_flughafen_id   NUMBER NOT NULL,
    fluggesellschaft_id NUMBER NOT NULL,
    CONSTRAINT pk_flugstrecke PRIMARY KEY (start_flughafen_id, ziel_flughafen_id),
    CONSTRAINT fk_flugstrecken_start_flughafen FOREIGN KEY (start_flughafen_id) REFERENCES flughafen (id),
    CONSTRAINT fk_flugstrecken_ziel_flughafen FOREIGN KEY (ziel_flughafen_id) REFERENCES flughafen (id),
    CONSTRAINT fk_flugstrecken_fluggesellschaft FOREIGN KEY (fluggesellschaft_id) REFERENCES fluggesellschaften (id)
);

commit;

