BEGIN;

CREATE SCHEMA IF NOT EXISTS AI_med;
SET search_path TO AI_med;
SHOW search_path;


CREATE TABLE IF NOT EXISTS ai_med."Aktualnie przyjmowane leki"
(
    id serial NOT NULL,
    data_rozpoczecia_atorvastatin_calcium__cholesterol date,
    data_rozpoczecia_ventolin__asthma date,
    data_rozpoczecia_hydrochlorothiazide__wysokie_cisnienie_krwi date,
    data_zakonczenia_atorvastatin_calcium__cholesterol date,
    data_zakonczenia_ventolin__asthma date,
    data_zakonczenia_hydrochlorothiazide__wysokie_cisnienie_krwi date,
	pacjentid integer NOT NULL,
	CONSTRAINT "Aktualnie przyjmowane leki_pkey" PRIMARY KEY (id, pacjentid),
    CONSTRAINT "Aktualnie przyjmowane leki_id_pkey" UNIQUE (id)
	
);

CREATE TABLE IF NOT EXISTS ai_med."Nazwa pliku z notatkami lekarskimi"
(
    lekarz_rodzinny character varying(100) COLLATE pg_catalog."default" NOT NULL,
    radiolog character varying(100) COLLATE pg_catalog."default" NOT NULL,
    pacjentid integer NOT NULL,
    CONSTRAINT "Nazwa pliku z notatkami lekarskimi_pkey" PRIMARY KEY (lekarz_rodzinny, radiolog, pacjentid),
    CONSTRAINT "Nazwa pliku z notatkami lekarskimi_lekarz_rodzinny_key" UNIQUE (lekarz_rodzinny),
    CONSTRAINT "Nazwa pliku z notatkami lekarskimi_radiolog_key" UNIQUE (radiolog)
);

CREATE TABLE IF NOT EXISTS ai_med."leczenie_w_kierunku_kod_ICD_10"
(
    id serial NOT NULL,
    data_rozpoczecia_leczenia_u07 date,
    data_rozpoczecia_leczenia_i10 date,
    data_rozpoczecia_leczenia_j45 date,
    data_zakonczenia_leczenia_u07 date,
    data_zakonczenia_leczenia_i10 date,
    data_zakonczenia_leczenia_j45 date,
	pacjentid integer NOT NULL,
	CONSTRAINT "leczenie_w_kierunku_kod_ICD_10_pkey" PRIMARY KEY (id, pacjentid),
    CONSTRAINT "leczenie_w_kierunku_kod_ICD_id_10_pkey" UNIQUE (id)
);

CREATE TABLE IF NOT EXISTS ai_med.morfologia
(
    id serial NOT NULL,
    ilosc_erytrocytow real,
    stezenie_hemoglobiny real,
    mcv real,
    mch real,
    mchc real,
    rdw real,
    pacjentid integer NOT NULL,
    data_wykonanej_morfologii date,
    CONSTRAINT morfologia_pkey PRIMARY KEY (id, pacjentid),
    CONSTRAINT morfologia_id_key UNIQUE (id)
);

CREATE TABLE IF NOT EXISTS ai_med.objawy
(
    id serial NOT NULL,
    bol_glowy boolean,
    zmeczenie boolean,
    data_obserwowanych_objawow date,
	pacjentid integer NOT NULL,
	CONSTRAINT objawy_pkey PRIMARY KEY (id, pacjentid),
    CONSTRAINT objawy_id_key UNIQUE (id)
);

CREATE TABLE IF NOT EXISTS ai_med.obrazy
(
    radiologiczne character varying(100),
    histopatologiczne character varying(100),
    pacjentid integer NOT NULL,
    CONSTRAINT obrazy_pkey PRIMARY KEY (pacjentid, histopatologiczne, radiologiczne),
    CONSTRAINT obrazy_key UNIQUE (radiologiczne, histopatologiczne, pacjentid)
);

CREATE TABLE IF NOT EXISTS ai_med.operacje
(
    id serial NOT NULL,
    data_przeszczepu_serca date,
    data_wyciecia_migdalkow date,
	pacjentid integer NOT NULL,
	CONSTRAINT operacje_pkey PRIMARY KEY (id, pacjentid),
    CONSTRAINT operacje_id_pkey UNIQUE (id)
);

CREATE TABLE IF NOT EXISTS ai_med.pacjent
(
    id serial NOT NULL,
    imie character varying(57) COLLATE pg_catalog."default" NOT NULL,
    nazwisko character varying(57) COLLATE pg_catalog."default" NOT NULL,
    data_urodzenia date NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT pacjent_pkey PRIMARY KEY (id)
);



--NOWE
CREATE TABLE IF NOT EXISTS ai_med.pacjent_insert_timestamp_table
(
    id serial NOT NULL,
    ostatni_insert_danych date NOT NULL,
    ostatnie_powiadomienie_dla_mle date,
	pacjentid integer NOT NULL,
	CONSTRAINT pacjent_insert_timestamp_table_pkey PRIMARY KEY (id, pacjentid),
    CONSTRAINT pacjent_insert_timestamp_table_id_key UNIQUE (id)
);




ALTER TABLE IF EXISTS ai_med."Aktualnie przyjmowane leki"
	ADD CONSTRAINT "FKAktualnie 792425" FOREIGN KEY (pacjentid)
    REFERENCES ai_med.pacjent (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS ai_med."Nazwa pliku z notatkami lekarskimi"
    ADD CONSTRAINT "FKNazwa plik780425" FOREIGN KEY (pacjentid)
    REFERENCES ai_med.pacjent (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS ai_med."leczenie_w_kierunku_kod_ICD_10"
	ADD CONSTRAINT "FKleczenie_w777425" FOREIGN KEY (pacjentid)
    REFERENCES ai_med.pacjent (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS ai_med.morfologia
    ADD CONSTRAINT fkmorfologia741262 FOREIGN KEY (pacjentid)
    REFERENCES ai_med.pacjent (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS ai_med.objawy
	ADD CONSTRAINT fkobjawy580425 FOREIGN KEY (pacjentid)
    REFERENCES ai_med.pacjent (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS ai_med.obrazy
    ADD CONSTRAINT fkobrazy350846 FOREIGN KEY (pacjentid)
    REFERENCES ai_med.pacjent (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS ai_med.operacje
    ADD CONSTRAINT fkoperacje280425 FOREIGN KEY (pacjentid)
    REFERENCES ai_med.pacjent (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;



--NOWE
ALTER TABLE IF EXISTS ai_med.pacjent_insert_timestamp_table
    ADD CONSTRAINT "FKpacjent_in150425" FOREIGN KEY (pacjentid)
    REFERENCES ai_med.pacjent (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


END;