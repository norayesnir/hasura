SET check_function_bodies = false
;

CREATE TABLE users(
  id uuid NOT NULL,
  "name" text NOT NULL,
  bio text,
  birthday date,
  profession text,
  "location" text,
  website text,
  followers integer,
  "following" integer,
  joined_at date,
  tweet_id uuid NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY(id, "name")
);

COMMENT ON TABLE users IS 'user data';

CREATE TABLE tweet(
  id uuid NOT NULL,
  audience text,
  "value" text NOT NULL,
  reply_restriction text,
  CONSTRAINT tweet_pkey PRIMARY KEY(id)
);

ALTER TABLE users
  ADD CONSTRAINT users_tweet_id_fkey FOREIGN KEY (tweet_id) REFERENCES tweet (id)
  ;
