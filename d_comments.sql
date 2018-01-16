DROP TABLE IF EXISTS d_comments CASCADE;

CREATE TABLE d_comments
(
   pk_comment               varchar(36)     NOT NULL,
   fk_run_comment           varchar(36),
   fk_service_comment       varchar(36),
   fk_post_info_comment     varchar(36),
   fk_account_info_comment  varchar(36),
   text                     varchar(2000),
   creation_date            timestamp,
   nb_liked                 integer,
   nb_comment               integer
);

ALTER TABLE rs.d_comments
   ADD CONSTRAINT d_comments_pkey
   PRIMARY KEY (pk_comment);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON d_comments TO elipce_rs;

COMMIT;
