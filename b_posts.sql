DROP TABLE IF EXISTS b_posts CASCADE;

CREATE TABLE b_posts
(
   pk_post               varchar(36)     NOT NULL,
   fk_run_post           varchar(36),
   author_name           varchar(100),
   author_industries     varchar(200),
   campain_name          varchar(200),
   connector_name        varchar(45),
   organisation_name     varchar(45),
   social_network_name   varchar(200),
   date_since            date,
   location_country      varchar(50),
   location_city         varchar(50),
   location_all_string   varchar(300),
   list_mention_account  varchar(500),
   interne_id            varchar(100),
   interne_code          varchar(100),
   type                  varchar(50),
   "group"               varchar(100),
   title                 varchar(1000),
   duration              integer,
   dimension             varchar(50),
   quality               varchar(50),
   creation_date         timestamp,
   text                  varchar(3000),
   re_is_shared          boolean,
   tags                  varchar(800),
   links                 varchar(800),
   tagged                boolean,
   owner                 boolean,
   nb_viewed             integer,
   nb_liked              integer,
   nb_disliked           integer,
   nb_shared             integer,
   nb_comment            integer,
   observation_date      timestamp
);

ALTER TABLE rs.b_posts
   ADD CONSTRAINT b_posts_pkey
   PRIMARY KEY (pk_post);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON b_posts TO elipce_rs;

COMMIT;
