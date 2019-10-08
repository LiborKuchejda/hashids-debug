SELECT COUNT('sss') ;

-- Js hashids       YXUM
-- Original psql    Y4UK
 -- x Zmena default    Y4UK 

SELECT encode_public_id(4,3);


CREATE FUNCTION public.encode_public_id(p_id integer, p_organisation_id integer) RETURNS text
    LANGUAGE plpgsql IMMUTABLE COST 300
    AS $$
  BEGIN
    RETURN hashids.encode_list(
      ARRAY[p_id, p_organisation_id],
      'salzburg', 
      3,
      'ABCDEFGHIJKLMNPQRSTUVWXYZ123456789');
  END;
  $$;