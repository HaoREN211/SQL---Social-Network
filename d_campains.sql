DROP TABLE IF EXISTS d_campains CASCADE;

CREATE TABLE d_campains
(
   pk_campain     integer        NOT NULL,
   date_since     date,
   campain_name   varchar(200),
   has_facebook   boolean,
   has_twitter    boolean,
   has_youtube    boolean,
   has_instagram  boolean,
   has_linkedin   boolean
);

ALTER TABLE rs.d_campains
   ADD CONSTRAINT d_campains_pkey
   PRIMARY KEY (pk_campain);

GRANT SELECT, RULE, INSERT, TRIGGER, DELETE, REFERENCES, UPDATE ON d_campains TO elipce_rs;

COMMIT;
