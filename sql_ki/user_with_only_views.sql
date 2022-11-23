create role view_reader; 
create schema view_holder;
grant select on all tables in schema ai_med to view_reader;
alter default privileges in schema view_holder grant select on tables to view_reader;
create user lekarz_perspektywa password 'lekarz_perspektywa';
alter user lekarz_perspektywa set search_path = 'view_holder';
grant view_reader to lekarz_perspektywa;
GRANT USAGE ON SCHEMA view_holder TO lekarz_perspektywa;