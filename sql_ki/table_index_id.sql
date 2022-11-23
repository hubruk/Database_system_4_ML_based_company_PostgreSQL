DROP INDEX IF EXISTS ai_med.imie_pacjenta;
--CREATE INDEX imie_pacjenta on ai_med.pacjent using gin(imie ai_med.gin_trgm_ops);

SELECT
    pg_size_pretty (pg_indexes_size('ai_med.pacjent')) as "index_size", 
pg_size_pretty (pg_relation_size('ai_med.pacjent')) as "table_size";
