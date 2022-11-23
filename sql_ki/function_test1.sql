CREATE OR REPLACE FUNCTION ai_med.test1 ()
RETURNS integer AS $total$
declare
	total integer;
BEGIN
   select count(*) into total from ai_med.pacjent;
   RETURN total;
END;
$total$ LANGUAGE plpgsql;