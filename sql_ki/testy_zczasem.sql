SELECT id, data_rozpoczecia_ventolin__asthma - coalesce(data_zakonczenia_ventolin__asthma, cast(now() as date)) as "dni_brania_ventolin", data_zakonczenia_ventolin__asthma
FROM ai_med."Aktualnie przyjmowane leki"