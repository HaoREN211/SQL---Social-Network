DROP TABLE IF EXISTS a_campain_tags CASCADE;

CREATE TABLE a_campain_tags
(
   pk_campain_tag        integer       NOT NULL,
   fk_campain_ct         integer       NOT NULL,
   fk_social_network_ct  integer       NOT NULL,
   tag_name              varchar(50),
   is_main_account       boolean
);

ALTER TABLE rs.a_campain_tags
   ADD CONSTRAINT a_campain_tags_pkey
   PRIMARY KEY (pk_campain_tag);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON a_campain_tags TO elipce_rs;

COMMIT;
