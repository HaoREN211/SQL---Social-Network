DROP TABLE IF EXISTS f_accounts CASCADE;

CREATE TABLE f_accounts
(
   pk_account                varchar(36)   NOT NULL,
   fk_run_acc                varchar(36),
   fk_service_acc            varchar(36),
   fk_account_info_acc       varchar(36)   NOT NULL,
   fk_campain_acc            integer       NOT NULL,
   fk_social_network_acc     integer       NOT NULL,
   fk_location_acc           varchar(36),
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

ALTER TABLE rs.f_accounts
   ADD CONSTRAINT f_accounts_pkey
   PRIMARY KEY (pk_account);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON f_accounts TO elipce_rs;

COMMIT;
