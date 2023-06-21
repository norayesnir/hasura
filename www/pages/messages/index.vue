<template>
  <div class="home">
    <div class="content">
      <ContentViewChanger />
      <ContentTweet />
    </div>
    <div class="informatives">
      <InformativeSearch />
      <InformativeGetVerified />
      <InformativeTrendsForYou />
      <InformativeWhoToFillow />
      <InformativeAdditional />
    </div>
  </div>
</template>

<style scoped lang="scss">
.home{
  display: flex;
  gap: 25px;

  .content{
    width: 600px;
    border-left: var(--border-color) 1px solid;
    border-right: var(--border-color) 1px solid;
  }

  .informatives{
    width: 350px;
    background-color: var(--hover-bg);
    border-radius: 25px;
    margin-top: 12.5px;
  }
}
</style>