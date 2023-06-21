alter table "public"."users" drop constraint "users_tweet_id_fkey",
  add constraint "users_tweet_id_fkey"
  foreign key ("tweet_id")
  references "public"."tweet"
  ("id") on update no action on delete no action;
