DROP TABLE IF EXISTS d_locations CASCADE;

CREATE TABLE d_locations
(
   pk_location          varchar(36)    NOT NULL,
   fk_run_location      varchar(36),
   fk_service_location  varchar(36),
   country              varchar(50),
   city                 varchar(50),
   street               varchar(200),
   zip                  varchar(10),
   latitude             float8,
   longitude            float8,
   all_string           varchar(300)
);

ALTER TABLE rs.d_locations
   ADD CONSTRAINT d_locations_pkey
   PRIMARY KEY (pk_location);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON d_locations TO elipce_rs;

COMMIT;
