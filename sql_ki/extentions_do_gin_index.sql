create extension pg_trgm with schema ai_med;

create extension intarray with schema ai_med; 

alter user inzdanych set search_path = 'ai_med,public,view_holder,...';