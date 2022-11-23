SELECT coalesce("Aktualnie przyjmowane leki".data_zakonczenia_ventolin__asthma, cast(now() as date)) -"Aktualnie przyjmowane leki".data_rozpoczecia_ventolin__asthma as "dni_brania_ventolin",
pacjent.imie, pacjent.nazwisko, "Aktualnie przyjmowane leki".data_rozpoczecia_atorvastatin_calcium__cholesterol, "Aktualnie przyjmowane leki".data_rozpoczecia_ventolin__asthma, "Aktualnie przyjmowane leki".data_rozpoczecia_hydrochlorothiazide__wysokie_cisnienie_krwi, "Aktualnie przyjmowane leki".data_zakonczenia_atorvastatin_calcium__cholesterol, "Aktualnie przyjmowane leki".data_zakonczenia_ventolin__asthma, "Aktualnie przyjmowane leki".data_zakonczenia_hydrochlorothiazide__wysokie_cisnienie_krwi 
FROM ai_med.pacjent INNER JOIN ai_med."Aktualnie przyjmowane leki" 
ON "Aktualnie przyjmowane leki".id = pacjent.id 
WHERE DATE_TRUNC('day',"Aktualnie przyjmowane leki".data_rozpoczecia_ventolin__asthma) >= CURRENT_DATE - interval '4 year' 
ORDER BY dni_brania_ventolin;