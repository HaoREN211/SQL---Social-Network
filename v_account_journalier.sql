-- Calculer les données journalières

DROP VIEW IF EXISTS v_account_journalier CASCADE;

CREATE OR REPLACE VIEW v_account_journalier
(
  social_network_name,
  campain_name,
  organisation_name,
  name,
  creation_date,
  date_since,
  nb_account_viewed,
  nb_account_viewed_moins_un,
  nb_account_viewed_jour,
  nb_account_likes_jour,
  nb_account_follows_jour,
  nb_account_followed,
  nb_account_followed_moins_un,
  nb_account_followed_jour,
  nb_account_comment_jour,
  nb_post_viewed,
  nb_post_viewed_moins_un,
  nb_post_viewed_jour,
  nb_post_liked,
  nb_post_liked_moins_un,
  nb_post_liked_jour,
  nb_post_disliked_moins_un_jour,
  nb_post_shared_jour,
  nb_post_comment_jour,
  nb_post,
  nb_post_moins_un,
  nb_post_jour,
  nb_employee_jour,
  observation_date,
  date_moins_un
)
AS 
 SELECT v_accounts.social_network_name, v_accounts.campain_name, v_accounts.organisation_name, v_accounts.name, v_accounts.creation_date, v_accounts.date_since, v_accounts.nb_account_viewed, b_accounts_moins_un.nb_account_viewed_moins_un, 
        CASE
            WHEN (v_accounts.nb_account_viewed - b_accounts_moins_un.nb_account_viewed_moins_un) >= 0 THEN v_accounts.nb_account_viewed - b_accounts_moins_un.nb_account_viewed_moins_un
            ELSE 0
        END AS nb_account_viewed_jour, 
        CASE
            WHEN (v_accounts.nb_account_likes - b_accounts_moins_un.nb_account_likes_moins_un) >= 0 THEN v_accounts.nb_account_likes - b_accounts_moins_un.nb_account_likes_moins_un
            ELSE 0
        END AS nb_account_likes_jour, 
        CASE
            WHEN (v_accounts.nb_account_follows - b_accounts_moins_un.nb_account_follows_moins_un) IS NOT NULL THEN v_accounts.nb_account_follows - b_accounts_moins_un.nb_account_follows_moins_un
            ELSE 0
        END AS nb_account_follows_jour, v_accounts.nb_account_followed, b_accounts_moins_un.nb_account_followed_moins_un, 
        CASE
            WHEN (v_accounts.nb_account_followed - b_accounts_moins_un.nb_account_followed_moins_un) IS NOT NULL THEN v_accounts.nb_account_followed - b_accounts_moins_un.nb_account_followed_moins_un
            ELSE 0
        END AS nb_account_followed_jour, 
        CASE
            WHEN (v_accounts.nb_account_comment - b_accounts_moins_un.nb_account_comment_moins_un) >= 0 THEN v_accounts.nb_account_comment - b_accounts_moins_un.nb_account_comment_moins_un
            ELSE 0
        END AS nb_account_comment_jour, v_accounts.nb_post_viewed, b_accounts_moins_un.nb_post_viewed_moins_un, 
        CASE
            WHEN (v_accounts.nb_post_viewed - b_accounts_moins_un.nb_post_viewed_moins_un) >= 0 THEN v_accounts.nb_post_viewed - b_accounts_moins_un.nb_post_viewed_moins_un
            ELSE 0
        END AS nb_post_viewed_jour, v_accounts.nb_post_liked, b_accounts_moins_un.nb_post_liked_moins_un, 
        CASE
            WHEN (v_accounts.nb_post_liked - b_accounts_moins_un.nb_post_liked_moins_un) >= 0 THEN v_accounts.nb_post_liked - b_accounts_moins_un.nb_post_liked_moins_un
            ELSE 0
        END AS nb_post_liked_jour, 
        CASE
            WHEN (v_accounts.nb_post_disliked - b_accounts_moins_un.nb_post_disliked_moins_un) >= 0 THEN v_accounts.nb_post_disliked - b_accounts_moins_un.nb_post_disliked_moins_un
            ELSE 0
        END AS nb_post_disliked_moins_un_jour, 
        CASE
            WHEN (v_accounts.nb_post_shared - b_accounts_moins_un.nb_post_shared_moins_un) >= 0 THEN v_accounts.nb_post_shared - b_accounts_moins_un.nb_post_shared_moins_un
            ELSE 0
        END AS nb_post_shared_jour, 
        CASE
            WHEN (v_accounts.nb_post_comment - b_accounts_moins_un.nb_post_comment_moins_un) >= 0 THEN v_accounts.nb_post_comment - b_accounts_moins_un.nb_post_comment_moins_un
            ELSE 0
        END AS nb_post_comment_jour, v_accounts.nb_post, b_accounts_moins_un.nb_post_moins_un, 
        CASE
            WHEN (v_accounts.nb_post - b_accounts_moins_un.nb_post_moins_un) >= 0 THEN v_accounts.nb_post - b_accounts_moins_un.nb_post_moins_un
            ELSE 0
        END AS nb_post_jour, 
        CASE
            WHEN (v_accounts.nb_employee - b_accounts_moins_un.nb_employee_moins_un) >= 0 THEN v_accounts.nb_employee - b_accounts_moins_un.nb_employee_moins_un
            ELSE 0
        END AS nb_employee_jour, date(v_accounts.observation_date) AS observation_date, b_accounts_moins_un.date_moins_un_un AS date_moins_un
   FROM v_accounts
   JOIN ( SELECT v_accounts.social_network_name AS social_network_name_moins_un, v_accounts.campain_name AS campain_name_moins_un, v_accounts.name AS name_moins_un, v_accounts.nb_account_viewed AS nb_account_viewed_moins_un, v_accounts.nb_account_likes AS nb_account_likes_moins_un, v_accounts.nb_account_follows AS nb_account_follows_moins_un, v_accounts.nb_account_followed AS nb_account_followed_moins_un, v_accounts.nb_account_talking_about AS nb_account_talking_about_moins_un, v_accounts.nb_account_comment AS nb_account_comment_moins_un, v_accounts.nb_post_viewed AS nb_post_viewed_moins_un, v_accounts.nb_post_liked AS nb_post_liked_moins_un, v_accounts.nb_post_disliked AS nb_post_disliked_moins_un, v_accounts.nb_post_shared AS nb_post_shared_moins_un, v_accounts.nb_post_comment AS nb_post_comment_moins_un, v_accounts.nb_post AS nb_post_moins_un, v_accounts.nb_employee AS nb_employee_moins_un, v_accounts.observation_date AS date_moins_un_un, date(date_add('day'::text, 1::bigint, date(v_accounts.observation_date)::timestamp without time zone)) AS date_moins_un
           FROM v_accounts) b_accounts_moins_un ON date(v_accounts.observation_date) = b_accounts_moins_un.date_moins_un AND v_accounts.social_network_name::text = b_accounts_moins_un.social_network_name_moins_un::text AND v_accounts.campain_name::text = b_accounts_moins_un.campain_name_moins_un::text AND v_accounts.name::text = b_accounts_moins_un.name_moins_un::text;

GRANT SELECT, TRIGGER ON v_account_journalier TO elipce_rs;


COMMIT;
