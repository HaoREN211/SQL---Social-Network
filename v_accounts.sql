DROP VIEW IF EXISTS v_accounts CASCADE;

CREATE OR REPLACE VIEW v_accounts
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
 SELECT b_accounts.pk_account, b_accounts.fk_run_acc, b_accounts.social_network_name, b_accounts.campain_name, b_accounts.connector_name, b_accounts.organisation_name, b_accounts.interne_id, b_accounts.name, b_accounts.description, b_accounts.industries, b_accounts.specialties, b_accounts.status, b_accounts.phones, b_accounts.emails, b_accounts.creation_date, b_accounts.date_since, b_accounts.location_country, b_accounts.location_city, b_accounts.location_all_string, b_accounts.nb_account_viewed, b_accounts.nb_account_likes, b_accounts.nb_account_follows, 
        CASE
            WHEN b_accounts.social_network_name::text = 'Facebook'::text THEN b_accounts.nb_account_likes
            ELSE b_accounts.nb_account_followed
        END AS nb_account_followed, b_accounts.nb_account_talking_about, b_accounts.nb_account_comment, b_accounts.nb_post_viewed, b_accounts.nb_post_liked, b_accounts.nb_post_disliked, b_accounts.nb_post_shared, b_accounts.nb_post_comment, b_accounts.nb_post, b_accounts.nb_employee, b_accounts.observation_date
   FROM b_accounts;

GRANT SELECT, TRIGGER ON rs.v_accounts TO elipce_rs;

COMMIT;
