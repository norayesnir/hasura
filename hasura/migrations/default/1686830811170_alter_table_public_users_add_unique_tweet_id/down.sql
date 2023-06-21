alter table "public"."users" drop constraint "users_tweet_id_key";
alter table "public"."users" add constraint "users_tweet_id_key" unique ("tweet_id");
