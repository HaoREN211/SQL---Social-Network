DROP VIEW IF EXISTS v_donnees_precedent CASCADE;

CREATE OR REPLACE VIEW v_donnees_precedent
(
  social_network_name,
  campain_name,
  organisation_name,
  nb_account_viewed,
  nb_account_likes,
  nb_account_follows,
  nb_account_followed,
  nb_account_talking_about,
  nb_account_comment,
  nb_post_viewed,
  nb_post_liked,
  nb_post_disliked,
  nb_post_shared,
  nb_post_comment,
  nb_post,
  nb_employee,
  nb_jour,
  mois,
  annee,
  description
)
AS 
( SELECT v_accounts.social_network_name, v_accounts.campain_name, v_accounts.organisation_name, sum(v_accounts.nb_account_viewed) AS nb_account_viewed, sum(v_accounts.nb_account_likes) AS nb_account_likes, sum(v_accounts.nb_account_follows) AS nb_account_follows, sum(v_accounts.nb_account_followed) AS nb_account_followed, sum(v_accounts.nb_account_talking_about) AS nb_account_talking_about, sum(v_accounts.nb_account_comment) AS nb_account_comment, sum(v_accounts.nb_post_viewed) AS nb_post_viewed, sum(v_accounts.nb_post_liked) AS nb_post_liked, sum(v_accounts.nb_post_disliked) AS nb_post_disliked, sum(v_accounts.nb_post_shared) AS nb_post_shared, sum(v_accounts.nb_post_comment) AS nb_post_comment, sum(v_accounts.nb_post) AS nb_post, sum(v_accounts.nb_employee) AS nb_employee, count(v_accounts.campain_name) AS nb_jour, pgdate_part('month'::text, v_accounts.observation_date) AS mois, pgdate_part('y'::text, v_accounts.observation_date) AS annee, 'Mois Précédent' AS description
   FROM v_accounts
  WHERE pgdate_part('y'::text, v_accounts.observation_date) = pgdate_part('y'::text, date_add('month'::text, -1::bigint, date_add('d'::text, -1::bigint, 'now'::text::date::timestamp without time zone))) AND pgdate_part('month'::text, v_accounts.observation_date) = pgdate_part('month'::text, date_add('month'::text, -1::bigint, date_add('d'::text, -1::bigint, 'now'::text::date::timestamp without time zone)))
  GROUP BY v_accounts.campain_name, v_accounts.organisation_name, v_accounts.social_network_name, pgdate_part('month'::text, v_accounts.observation_date), pgdate_part('y'::text, v_accounts.observation_date)
UNION 
 SELECT v_accounts.social_network_name, v_accounts.campain_name, v_accounts.organisation_name, v_accounts.nb_account_viewed, v_accounts.nb_account_likes, v_accounts.nb_account_follows, v_accounts.nb_account_followed, v_accounts.nb_account_talking_about, v_accounts.nb_account_comment, v_accounts.nb_post_viewed, v_accounts.nb_post_liked, v_accounts.nb_post_disliked, v_accounts.nb_post_shared, v_accounts.nb_post_comment, v_accounts.nb_post, v_accounts.nb_employee, 1 AS nb_jour, pgdate_part('month'::text, v_accounts.observation_date) AS mois, pgdate_part('y'::text, v_accounts.observation_date) AS annee, 'Jour Précédent' AS description
   FROM v_accounts
  WHERE date_cmp(date(v_accounts.observation_date), date(date_add('d'::text, -2::bigint, 'now'::text::date::timestamp without time zone))) = 0)
UNION 
 SELECT v_accounts.social_network_name, v_accounts.campain_name, v_accounts.organisation_name, sum(v_accounts.nb_account_viewed) AS nb_account_viewed, sum(v_accounts.nb_account_likes) AS nb_account_likes, sum(v_accounts.nb_account_follows) AS nb_account_follows, sum(v_accounts.nb_account_followed) AS nb_account_followed, sum(v_accounts.nb_account_talking_about) AS nb_account_talking_about, sum(v_accounts.nb_account_comment) AS nb_account_comment, sum(v_accounts.nb_post_viewed) AS nb_post_viewed, sum(v_accounts.nb_post_liked) AS nb_post_liked, sum(v_accounts.nb_post_disliked) AS nb_post_disliked, sum(v_accounts.nb_post_shared) AS nb_post_shared, sum(v_accounts.nb_post_comment) AS nb_post_comment, sum(v_accounts.nb_post) AS nb_post, sum(v_accounts.nb_employee) AS nb_employee, count(v_accounts.campain_name) AS nb_jour, NULL::"unknown" AS mois, pgdate_part('y'::text, v_accounts.observation_date) AS annee, 'Année Précédent' AS description
   FROM v_accounts
  WHERE pgdate_part('y'::text, v_accounts.observation_date) = pgdate_part('y'::text, date_add('y'::text, -1::bigint, date_add('d'::text, -1::bigint, 'now'::text::date::timestamp without time zone)))
  GROUP BY v_accounts.campain_name, v_accounts.organisation_name, v_accounts.social_network_name, pgdate_part('y'::text, v_accounts.observation_date);

COMMIT;
