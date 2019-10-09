SELECT COUNT('sss') ;

CREATE OR REPLACE FUNCTION public.encode_public_id(p_id integer, p_organisation_id integer) RETURNS text
    LANGUAGE plpgsql 
    AS $$
  BEGIN
    RETURN hashids.encode_list(
      ARRAY[p_id, p_organisation_id],
      'salzburg', 
      3,
      'ABCDEFGHIJKLMNPQRSTUVWXYZ123456789');
  END;
  $$;

-- Js hashids           YXUM
-- Original psql        Y4UK


-- ## OLD


CREATE OR REPLACE FUNCTION public.encode_public_id(p_id integer, p_organisation_id integer) RETURNS text
    LANGUAGE plpgsql 
    AS $$
  BEGIN
    RETURN hashids.encode_list(
      ARRAY[p_id, p_organisation_id],
      'salzburg', 
      3,
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890');
  END;
  $$;

-- Js hashids           REu9
-- Original psql        REu9

  SELECT encode_public_id(4,3);

  SELECT encode_public_id(NULL);

  SELECT hashids.hash(5,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890');