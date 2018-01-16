DROP TABLE IF EXISTS d_post_infos CASCADE;

CREATE TABLE d_post_infos
(
   pk_post_info          varchar(36)     NOT NULL,
   fk_run_pi             varchar(36),
   fk_service_pi         varchar(36),
   fk_social_network_pi  integer         NOT NULL,
   interne_id            varchar(100),
   interne_code          varchar(100),
   type                  varchar(50),
   "group"               varchar(100),
   title                 varchar(1000),
   creation_date         timestamp,
   re_is_shared          boolean,
   duration              integer,
   dimension             varchar(50),
   quality               varchar(50),
   text                  varchar(3000),
   tags                  varchar(800),
   links                 varchar(800)
);

ALTER TABLE rs.d_post_infos
   ADD CONSTRAINT d_post_infos_pkey
   PRIMARY KEY (pk_post_info);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON d_post_infos TO elipce_rs;

COMMIT;
