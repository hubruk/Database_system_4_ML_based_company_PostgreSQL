CREATE SCHEMA IF NOT EXISTS AI_med;
SET search_path TO AI_med;
SHOW search_path;

CREATE USER inzdanych123 WITH
  LOGIN
  SUPERUSER
  INHERIT
  CREATEDB  
  CREATEROLE
  REPLICATION
  ENCRYPTED PASSWORD 'inzdanych123';

--ALTER DATABASE ZSBD_p1 OWNER TO inzdanych;

GRANT all privileges ON ALL TABLES IN SCHEMA ai_med TO inzdanych;

CREATE USER lekarz123 with ENCRYPTED PASSWORD 'lekarz123';
GRANT USAGE ON SCHEMA ai_med TO lekarz123;
GRANT SELECT ON ALL TABLES IN SCHEMA ai_med TO lekarz123;


CREATE USER pacjent123 WITH ENCRYPTED PASSWORD 'pacjent123';
GRANT USAGE ON SCHEMA ai_med TO pacjent123;
GRANT INSERT ON ALL TABLES IN SCHEMA ai_med TO pacjent123;

CREATE USER inzml123 with encrypted password 'inzml123';
GRANT USAGE ON SCHEMA ai_med TO inzml123;
GRANT all privileges ON SCHEMA ai_med to inzml123;