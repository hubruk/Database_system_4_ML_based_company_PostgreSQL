CREATE OR REPLACE VIEW view_holder.wyniki_morfologii_dla_brak_objawow AS
SELECT pacjent.imie, pacjent.nazwisko, extract(year from age(now(), pacjent.data_urodzenia)) as wiek_pacjenta
,morfologia.ilosc_erytrocytow, morfologia.stezenie_hemoglobiny , morfologia.mcv, morfologia.mchc, morfologia.mch, morfologia.rdw, morfologia.data_wykonanej_morfologii
--,objawy.bol_glowy, objawy.zmeczenie
FROM ai_med.pacjent 
INNER JOIN ai_med.objawy ON objawy.id = pacjent.id
INNER JOIN ai_med.morfologia ON morfologia.pacjentid = pacjent.id
WHERE objawy.bol_glowy = FALSE AND objawy.zmeczenie = FALSE
ORDER BY objawy.bol_glowy;