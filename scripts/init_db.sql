DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'tsungchh') THEN
        CREATE ROLE tsungchh WITH PASSWORD 'tsungchh';
        GRANT ALL PRIVILEGES ON DATABASE foodiedb TO tsungchh;
    END IF;
END
$$;

\connect foodiedb


CREATE TABLE IF NOT EXISTS
users (
  id           integer PRIMARY KEY,
  name         varchar(200),
  delete_tag   integer,
  created_date timestamp
);

CREATE TABLE IF NOT EXISTS
places (
  id           integer PRIMARY KEY,
  name         varchar(200),
  gid          integer,
  address      varchar(200),
  yelpurl      varchar(200),
  delete_tag   integer, 
  count        integer,
  created_date timestamp
);

CREATE TABLE IF NOT EXISTS
users_places (
  uid          integer,
  pid          integer,
  PRIMARY KEY(uid, pid)
);

COMMIT;