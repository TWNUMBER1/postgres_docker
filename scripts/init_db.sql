
\connect foodiedb

CREATE TABLE IF NOT EXISTS
users (
  id           SERIAL NOT NULL PRIMARY KEY,
  name         varchar(200) UNIQUE,
  delete_tag   integer,
  created_date timestamp
);

CREATE TABLE IF NOT EXISTS
places (
  id           SERIAL NOT NULL PRIMARY KEY,
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
  uid          integer references users(id),
  pid          integer references places(id),
  PRIMARY KEY(uid, pid)
);

COMMIT;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'tsungchh') THEN
        CREATE ROLE tsungchh WITH PASSWORD 'tsungchh';
        GRANT ALL PRIVILEGES ON DATABASE foodiedb TO tsungchh;
        GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO tsungchh;
        GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO tsungchh;
        ALTER ROLE tsungchh WITH LOGIN;
    END IF;
END
$$;