-- Créer une vue qui contient une sequence de chiffre de 1 à 14;

DROP VIEW IF EXISTS d_sequence CASCADE;

CREATE OR REPLACE VIEW d_sequence
(
  i
)
AS 
((((((((((((( SELECT 0 AS i
UNION ALL 
 SELECT 1 AS i)
UNION ALL 
 SELECT 2 AS i)
UNION ALL 
 SELECT 3 AS i)
UNION ALL 
 SELECT 4 AS i)
UNION ALL 
 SELECT 5 AS i)
UNION ALL 
 SELECT 6 AS i)
UNION ALL 
 SELECT 7 AS i)
UNION ALL 
 SELECT 8 AS i)
UNION ALL 
 SELECT 9 AS i)
UNION ALL 
 SELECT 10 AS i)
UNION ALL 
 SELECT 11 AS i)
UNION ALL 
 SELECT 12 AS i)
UNION ALL 
 SELECT 13 AS i)
UNION ALL 
 SELECT 14 AS i;



GRANT RULE, UPDATE, REFERENCES, SELECT, INSERT, TRIGGER, DELETE ON d_sequence TO elipce_rs;


COMMIT;
