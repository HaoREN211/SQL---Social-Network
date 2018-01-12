create or replace view v_hashtags_by_rs as
SELECT b_hashtags.hashtag,
       b_hashtags.social_network_name,
       b_hashtags.campain_name,
       b_hashtags.organisation_name,
       b_hashtags.creation_date,
       nb_post,
       hashtags_cmp.nb_total_post,
       nb_liked,
       hashtags_cmp.nb_total_liked,
       nb_viewed,
       hashtags_cmp.nb_total_viewed,
       nb_disliked,
       hashtags_cmp.nb_total_disliked,
       nb_shared,
       hashtags_cmp.nb_total_shared,
       nb_comment,
       hashtags_cmp.nb_total_comment
FROM rs.b_hashtags INNER JOIN 
(
SELECT 
       social_network_name,
       campain_name,
       organisation_name,
       creation_date,
       SUM(nb_post) as nb_total_post,
       SUM(nb_liked) as nb_total_liked,
       SUM(nb_viewed) as nb_total_viewed,
       SUM(nb_disliked) as nb_total_disliked,
       SUM(nb_shared) as nb_total_shared,
       SUM(nb_comment) as nb_total_comment
FROM rs.b_hashtags
GROUP BY social_network_name, campain_name, organisation_name, creation_date
)hashtags_cmp 
ON b_hashtags.social_network_name=hashtags_cmp.social_network_name
AND b_hashtags.campain_name=hashtags_cmp.campain_name
AND b_hashtags.organisation_name=hashtags_cmp.organisation_name
AND b_hashtags.creation_date=hashtags_cmp.creation_date;


select * from rs.v_hashtags_by_rs
WHERE campain_name='Elipce Informatique'
AND organisation_name='Elipce Informatique';


GRANT SELECT, TRIGGER ON rs.v_hashtags_by_rs TO elipce_rs;

DROP VIEW rs.v_hashtags_by_rs;
