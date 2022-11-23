CREATE TABLE "Aktualnie przyjmowane leki"(
    "ID" INTEGER NOT NULL,
    "atorvastatin_calcium__cholesterol" BOOLEAN NULL,
    "ventolin__asthma" BOOLEAN NULL,
    "hydrochlorothiazide__wysokie_cisnienie_krwi" BOOLEAN NULL
);
ALTER TABLE
    "Aktualnie przyjmowane leki" ADD PRIMARY KEY("ID");
CREATE TABLE "leczenie_w_kierunku_kod_ICD-10"(
    "ID" INTEGER NOT NULL,
    "U07" BOOLEAN NULL,
    "I10" BOOLEAN NULL,
    "J45" BOOLEAN NULL,
    "R51" BOOLEAN NULL,
    "G43" BOOLEAN NULL
);
ALTER TABLE
    "leczenie_w_kierunku_kod_ICD-10" ADD PRIMARY KEY("ID");
CREATE TABLE "Morfologia"(
    "ID" INTEGER NOT NULL,
    "PacjentID" INTEGER NOT NULL
);
ALTER TABLE
    "Morfologia" ADD PRIMARY KEY("ID", "PacjentID");
ALTER TABLE
    "Morfologia" ADD CONSTRAINT "morfologia_id_unique" UNIQUE("ID");
CREATE TABLE "Nazwa pliku z notatkami lekarskimi"(
    "lekarz_rodzinny" VARCHAR(255) NULL,
    "radiolog" VARCHAR(255) NULL,
    "PacjentID" INTEGER NOT NULL
);
ALTER TABLE
    "Nazwa pliku z notatkami lekarskimi" ADD PRIMARY KEY(
        "lekarz_rodzinny",
        "radiolog",
        "PacjentID"
    );
ALTER TABLE
    "Nazwa pliku z notatkami lekarskimi" ADD CONSTRAINT "nazwa pliku z notatkami lekarskimi_lekarz_rodzinny_unique" UNIQUE("lekarz_rodzinny");
ALTER TABLE
    "Nazwa pliku z notatkami lekarskimi" ADD CONSTRAINT "nazwa pliku z notatkami lekarskimi_radiolog_unique" UNIQUE("radiolog");
CREATE TABLE "Objawy"(
    "ID" INTEGER NOT NULL,
    "bol_glowy" BOOLEAN NOT NULL,
    "zmeczenie" BOOLEAN NOT NULL
);
ALTER TABLE
    "Objawy" ADD PRIMARY KEY("ID");
CREATE TABLE "Obrazy"(
    "ID" INTEGER NOT NULL,
    "radiologiczne" BOOLEAN NULL,
    "histopatologiczne" BOOLEAN NULL,
    "PacjentID" INTEGER NOT NULL
);
ALTER TABLE
    "Obrazy" ADD PRIMARY KEY("ID", "PacjentID");
ALTER TABLE
    "Obrazy" ADD CONSTRAINT "obrazy_id_unique" UNIQUE("ID");
CREATE TABLE "Operacje"(
    "ID" INTEGER NOT NULL,
    "przeszczep_serca" BOOLEAN NOT NULL,
    "wyciecie_migdalkow" BOOLEAN NOT NULL
);
ALTER TABLE
    "Operacje" ADD PRIMARY KEY("ID");
CREATE TABLE "Pacjent"(
    "ID" INTEGER NOT NULL,
    "imie" VARCHAR(255) NOT NULL,
    "nazwisko" VARCHAR(255) NOT NULL,
    "wiek" DATE NOT NULL
);
ALTER TABLE
    "Pacjent" ADD PRIMARY KEY("ID");
CREATE TABLE "Pacjent_Aktualnie przyjmowane leki"(
    "PacjentID" INTEGER NOT NULL,
    "Aktualnie przyjmowane lekiID" INTEGER NOT NULL
);
ALTER TABLE
    "Pacjent_Aktualnie przyjmowane leki" ADD PRIMARY KEY(
        "PacjentID",
        "Aktualnie przyjmowane lekiID"
    );
CREATE TABLE "Pacjent_leczenie_w_kierunku_kod_ICD-10"(
    "PacjentID" INTEGER NOT NULL,
    "leczenie_w_kierunku_kod_ICD-10ID" INTEGER NOT NULL
);
ALTER TABLE
    "Pacjent_leczenie_w_kierunku_kod_ICD-10" ADD PRIMARY KEY(
        "PacjentID",
        "leczenie_w_kierunku_kod_ICD-10ID"
    );
CREATE TABLE "Pacjent_Objawy"(
    "PacjentID" INTEGER NOT NULL,
    "ObjawyID" INTEGER NOT NULL
);
ALTER TABLE
    "Pacjent_Objawy" ADD PRIMARY KEY("PacjentID", "ObjawyID");
CREATE TABLE "Pacjent_Operacje"(
    "PacjentID" INTEGER NOT NULL,
    "OperacjeID" INTEGER NOT NULL
);
ALTER TABLE
    "Pacjent_Operacje" ADD PRIMARY KEY("PacjentID", "OperacjeID");