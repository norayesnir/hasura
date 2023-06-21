import { defineStore } from "pinia";

export const useTweetsViewStore = defineStore("tweetsViewStore", {
  state: () => ({
    tweetViewState: false,
  }),
});