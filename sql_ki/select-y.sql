CREATE OR REPLACE VIEW view_holder.leki AS
SELECT coalesce("Aktualnie przyjmowane leki".data_zakonczenia_ventolin__asthma, cast(now() as date)) -"Aktualnie przyjmowane leki".data_rozpoczecia_ventolin__asthma as "dni_brania_ventolin",
pacjent.imie, pacjent.nazwisko, extract(year from age(now(), pacjent.data_urodzenia)) as wiek_pacjenta, 
"Aktualnie przyjmowane leki".data_rozpoczecia_ventolin__asthma, "Aktualnie przyjmowane leki".data_zakonczenia_ventolin__asthma
FROM ai_med.pacjent INNER JOIN ai_med."Aktualnie przyjmowane leki" 
ON "Aktualnie przyjmowane leki".id = pacjent.id 
WHERE DATE_TRUNC('day',"Aktualnie przyjmowane leki".data_rozpoczecia_ventolin__asthma) >= CURRENT_DATE - interval '4 year' 
ORDER BY dni_brania_ventolin;