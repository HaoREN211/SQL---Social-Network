-- Comparer les indicateurs entre par hashtags et par réseau social

create or replace view v_hashtags_by_rs as
SELECT 
       social_network_name,
       campain_name,
       organisation_name,
       creation_date,
       SUM(nb_post) as nb_post,
       SUM(nb_liked) as nb_liked,
       SUM(nb_viewed) as nb_viewed,
       SUM(nb_disliked) as nb_disliked,
       SUM(nb_shared) as nb_shared,
       SUM(nb_comment) as nb_comment
FROM b_hashtags
GROUP BY social_network_name, campain_name, organisation_name, creation_date;


select * from rs.v_hashtags_by_rs
WHERE campain_name='Elipce Informatique'
AND organisation_name='Elipce Informatique';


GRANT SELECT, TRIGGER ON rs.v_hashtags_by_rs TO elipce_rs;
