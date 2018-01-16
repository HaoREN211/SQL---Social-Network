DROP TABLE IF EXISTS b_hashtags CASCADE;

CREATE TABLE b_hashtags
(
   hashtag              varchar(100),
   social_network_name  varchar(200),
   campain_name         varchar(200),
   organisation_name    varchar(45),
   creation_date        date,
   nb_post              integer,
   nb_liked             integer,
   nb_viewed            integer,
   nb_disliked          integer,
   nb_shared            integer,
   nb_comment           integer
);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON b_hashtags TO elipce_rs;

COMMIT;
