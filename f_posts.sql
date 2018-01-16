DROP TABLE IF EXISTS f_posts CASCADE;

CREATE TABLE f_posts
(
   pk_post                  varchar(36)    NOT NULL,
   fk_run_post              varchar(36),
   fk_service_post          varchar(36),
   fk_post_info_post        varchar(36)    NOT NULL,
   fk_author_post           varchar(36)    NOT NULL,
   fk_mention_account_post  varchar(500),
   fk_location_post         varchar(36),
   fk_campain_post          integer        NOT NULL,
   fk_social_network_post   integer        NOT NULL,
   interne_id               varchar(50),
   tagged                   boolean,
   owner                    boolean,
   nb_viewed                integer,
   nb_liked                 integer,
   nb_disliked              integer,
   nb_shared                integer,
   nb_comment               integer,
   observation_date         timestamp
);

ALTER TABLE rs.f_posts
   ADD CONSTRAINT f_posts_pkey
   PRIMARY KEY (pk_post);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE, UNKNOWN ON f_posts TO elipce_rs;

COMMIT;
