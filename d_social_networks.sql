DROP TABLE IF EXISTS d_social_networks CASCADE;

CREATE TABLE d_social_networks
(
   pk_social_network    integer        NOT NULL,
   social_network_name  varchar(200)
);

ALTER TABLE rs.d_social_networks
   ADD CONSTRAINT d_social_networks_pkey
   PRIMARY KEY (pk_social_network);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON d_social_networks TO elipce_rs;

COMMIT;
