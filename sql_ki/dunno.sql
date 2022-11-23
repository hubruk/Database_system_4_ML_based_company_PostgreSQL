--GRANT SELECT ON ALL TABLES IN SCHEMA ai_med TO lekarz123;
--GRANT SELECT ON ALL TABLES IN SCHEMA ai_med TO nowypacjent;
--GRANT USAGE ON SCHEMA ai_med TO lekarz123;
--GRANT USAGE ON SCHEMA ai_med TO pacjent123;
--select * from ai_med.pacjent;
--GRANT USAGE ON SCHEMA ai_med TO pacjent123;
--GRANT INSERT ON ALL TABLES IN SCHEMA ai_med TO pacjent123;
--INSERT INTO ai_med.Pacjent(ID, imie, nazwisko, data_urodzenia) VALUES (555, 'dupa', 'dupa', '1996-04-21');
SELECT * FROM ai_med.pacjent;
SELECT * FROM ai_med."Aktualnie przyjmowane leki";

CREATE VIEW lekarz_leki as SELECT imie, 
nazwisko, 
data_urodzenia, 
'data_rozpoczecia_atorvastatin_calcium__cholesterol', 
'data_rozpoczecia_ventolin__asthma' ,
'data_rozpoczecia_hydrochlorothiazide__wysokie_cisnienie_krwi', 