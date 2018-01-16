DROP TABLE IF EXISTS b_accounts CASCADE;

CREATE TABLE b_accounts
(
   pk_account                varchar(36)     NOT NULL,
   fk_run_acc                varchar(36),
   social_network_name       varchar(200),
   campain_name              varchar(200),
   connector_name            varchar(45),
   organisation_name         varchar(45),
   interne_id                varchar(30),
   name                      varchar(100),
   description               varchar(2500),
   industries                varchar(250),
   specialties               varchar(250),
   status                    varchar(50),
   phones                    varchar(30),
   emails                    varchar(200),
   creation_date             timestamp,
   date_since                date,
   location_country          varchar(50),
   location_city             varchar(50),
   location_all_string       varchar(300),
   nb_account_viewed         integer,
   nb_account_likes          integer,
   nb_account_follows        integer,
   nb_account_followed       integer,
   nb_account_talking_about  integer,
   nb_account_comment        integer,
   nb_post_viewed            integer,
   nb_post_liked             integer,
   nb_post_disliked          integer,
   nb_post_shared            integer,
   nb_post_comment           integer,
   nb_post                   integer,
   nb_employee               integer,
   observation_date          timestamp
);

ALTER TABLE rs.b_accounts
   ADD CONSTRAINT b_accounts_pkey
   PRIMARY KEY (pk_account);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON b_accounts TO elipce_rs;

COMMIT;
