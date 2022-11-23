CREATE SCHEMA IF NOT EXISTS AI_med;
SET search_path TO AI_med;
SHOW search_path;


CREATE TABLE "Aktualnie przyjmowane leki" (
  ID                                          SERIAL NOT NULL, 
  atorvastatin_calcium__cholesterol           bool, 
  ventolin__asthma                            bool, 
  hydrochlorothiazide__wysokie_cisnienie_krwi bool, 
  PRIMARY KEY (ID));
CREATE TABLE "leczenie_w_kierunku_kod_ICD-10" (
  ID  SERIAL NOT NULL, 
  U07 bool, 
  I10 bool, 
  J45 bool, 
  R51 bool, 
  G43 bool, 
  PRIMARY KEY (ID));
CREATE TABLE Morfologia (
  ID                   SERIAL NOT NULL UNIQUE, 
  Ilosc_erytrocytow    float4, 
  stezenie_hemoglobiny float4, 
  MCV                  float4, 
  MCH                  float4, 
  MCHC                 float4, 
  RDW                  float4, 
  PacjentID            SERIAL NOT NULL, 
  PRIMARY KEY (ID, 
  PacjentID));
CREATE TABLE "Nazwa pliku z notatkami lekarskimi" (
  lekarz_rodzinny VARCHAR(100) UNIQUE, 
  radiolog        VARCHAR(100) UNIQUE, 
  PacjentID       SERIAL NOT NULL, 
  PRIMARY KEY (lekarz_rodzinny, radiolog, 
  PacjentID));
CREATE TABLE Objawy (
  ID        SERIAL NOT NULL, 
  bol_glowy bool NOT NULL, 
  zmeczenie bool NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Obrazy (
  ID                SERIAL NOT NULL UNIQUE, 
  radiologiczne     bool, 
  histopatologiczne bool, 
  PacjentID         SERIAL NOT NULL, 
  PRIMARY KEY (ID, 
  PacjentID));
CREATE TABLE Operacje (
  ID                 SERIAL NOT NULL, 
  przeszczep_serca   bool NOT NULL, 
  wyciecie_migdalkow bool NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Pacjent (
  ID       SERIAL NOT NULL, 
  imie     VARCHAR(57) NOT NULL, 
  nazwisko VARCHAR(57) NOT NULL, 
  wiek     date NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE "Pacjent_Aktualnie przyjmowane leki" (
  PacjentID                      SERIAL NOT NULL, 
  "Aktualnie przyjmowane lekiID" SERIAL NOT NULL, 
  PRIMARY KEY (PacjentID, 
  "Aktualnie przyjmowane lekiID"));
CREATE TABLE "Pacjent_leczenie_w_kierunku_kod_ICD-10" (
  PacjentID                          SERIAL NOT NULL, 
  "leczenie_w_kierunku_kod_ICD-10ID" SERIAL NOT NULL, 
  PRIMARY KEY (PacjentID, 
  "leczenie_w_kierunku_kod_ICD-10ID"));
CREATE TABLE Pacjent_Objawy (
  PacjentID SERIAL NOT NULL, 
  ObjawyID  SERIAL NOT NULL, 
  PRIMARY KEY (PacjentID, 
  ObjawyID));
CREATE TABLE Pacjent_Operacje (
  PacjentID  SERIAL NOT NULL, 
  OperacjeID SERIAL NOT NULL, 
  PRIMARY KEY (PacjentID, 
  OperacjeID));
ALTER TABLE Morfologia ADD CONSTRAINT FKMorfologia741262 FOREIGN KEY (PacjentID) REFERENCES Pacjent (ID);
ALTER TABLE "Nazwa pliku z notatkami lekarskimi" ADD CONSTRAINT "FKNazwa plik780425" FOREIGN KEY (PacjentID) REFERENCES Pacjent (ID);
ALTER TABLE Obrazy ADD CONSTRAINT FKObrazy350846 FOREIGN KEY (PacjentID) REFERENCES Pacjent (ID);
ALTER TABLE "Pacjent_leczenie_w_kierunku_kod_ICD-10" ADD CONSTRAINT FKPacjent_le349503 FOREIGN KEY (PacjentID) REFERENCES Pacjent (ID);
ALTER TABLE "Pacjent_leczenie_w_kierunku_kod_ICD-10" ADD CONSTRAINT FKPacjent_le368073 FOREIGN KEY ("leczenie_w_kierunku_kod_ICD-10ID") REFERENCES "leczenie_w_kierunku_kod_ICD-10" (ID);
ALTER TABLE "Pacjent_Aktualnie przyjmowane leki" ADD CONSTRAINT FKPacjent_Ak498623 FOREIGN KEY (PacjentID) REFERENCES Pacjent (ID);
ALTER TABLE "Pacjent_Aktualnie przyjmowane leki" ADD CONSTRAINT FKPacjent_Ak968980 FOREIGN KEY ("Aktualnie przyjmowane lekiID") REFERENCES "Aktualnie przyjmowane leki" (ID);
ALTER TABLE Pacjent_Operacje ADD CONSTRAINT FKPacjent_Op11149 FOREIGN KEY (PacjentID) REFERENCES Pacjent (ID);
ALTER TABLE Pacjent_Operacje ADD CONSTRAINT FKPacjent_Op831575 FOREIGN KEY (OperacjeID) REFERENCES Operacje (ID);
ALTER TABLE Pacjent_Objawy ADD CONSTRAINT FKPacjent_Ob595829 FOREIGN KEY (PacjentID) REFERENCES Pacjent (ID);
ALTER TABLE Pacjent_Objawy ADD CONSTRAINT FKPacjent_Ob779371 FOREIGN KEY (ObjawyID) REFERENCES Objawy (ID);