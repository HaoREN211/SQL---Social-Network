DROP TABLE IF EXISTS d_account_infos CASCADE;

CREATE TABLE d_account_infos
(
   pk_account_info       varchar(36)     NOT NULL,
   fk_run_ai             varchar(36),
   fk_service_ai         varchar(36),
   fk_social_network_ai  integer         NOT NULL,
   interne_id            varchar(30),
   name                  varchar(100),
   screen_name           varchar(100),
   description           varchar(2500),
   industries            varchar(250),
   specialties           varchar(250),
   status                varchar(50),
   phones                varchar(30),
   emails                varchar(200),
   links                 varchar(550),
   creation_date         timestamp
);

ALTER TABLE rs.d_account_infos
   ADD CONSTRAINT d_account_infos_pkey
   PRIMARY KEY (pk_account_info);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON d_account_infos TO elipce_rs;

COMMIT;
