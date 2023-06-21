<template>
  <div class="view-changer">
    <ContentCurrentRoute />
    <div class="changer">
      <div
        class="selection"
        :class="{ 'active': !tweetsView.tweetViewState }"
        @click="toggleTweetsView(false)"
      >
        <span>For you <div class="active-feedback"></div></span>
      </div>
      <div
        class="selection"
        :class="{ 'active': tweetsView.tweetViewState }"
        @click="toggleTweetsView(true)"
      >
        <span>Following <div class="active-feedback"></div></span>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { useRouter, RouteRecordRaw } from 'vue-router'
import { useTweetsViewStore } from "~/stores/useTweetsViewStore";
const router = useRouter()

export default defineComponent({
  setup() {
    const tweetsView = useTweetsViewStore();

    const toggleTweetsView = (value: boolean) => {
      tweetsView.$patch({ tweetViewState: value });
    };

    return {
      tweetsView,
      toggleTweetsView,
    };
  },
});
</script>


<style scoped lang="scss">
.view-changer{
  position: sticky;
  top: 0;
  display: flex;
  flex-direction: column;

  border-bottom: 1px solid var(--border-color);

  /* From https://css.glass */
  background: rgba(21, 32, 43, 0.75);
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(7.5px);
  -webkit-backdrop-filter: blur(8.9px);

  .changer{
    height: 50px;
    display: flex;
    align-items: center;

    .selection{
      cursor: pointer;
      font-size: 15px;
      color: var(--gray);
      width: 50%;
      height: 100%;

      display: flex;
      align-items: center;
      justify-content: center;

      span{
        width: fit-content;

        .active-feedback{
          transform: translateY(14px);
          height: 4px;
          width: 100%;
          border-radius: 2px;
          background-color: var(--blue);
          display: none;
        }
      }

      &:hover{
        background-color: var(--hover-bg);
      }
    }

    .selection:first-child{
      padding-left: 16px;
    }
    .selection:last-child{
      padding-right: 16px;
    }
  }

  .active{
    
    span{
      color: var(--foreground);
      font-weight: bolder;

      .active-feedback{
        display: block !important;
      }
    }
  }
}
</style>