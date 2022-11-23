SELECT pacjent.imie, pacjent.nazwisko, extract(year from age(now(), pacjent.data_urodzenia)) as wiek_pacjenta,
objawy.bol_glowy, objawy.zmeczenie, objawy.data_obserwowanych_objawow
FROM ai_med.pacjent INNER JOIN ai_med.objawy
ON objawy.id = pacjent.id
WHERE objawy.bol_glowy = FALSE AND objawy.zmeczenie = FALSE
ORDER BY objawy.bol_glowy;
