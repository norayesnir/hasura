<template>
  <div class="default-layout">
    <div class="navigations">
      <div class="top">
        <Logo size="24"/>
        <NavigationRoute />
        <NavigationCallToAction />
      </div>
      <NavigationPersona />
    </div>
    <div class="slot">
      <slot />
    </div>
  </div>
</template>

<style scoped lang="scss">
.default-layout{
  display: flex;
  gap: 25px;
  .navigations{
    display: flex;
    justify-content: space-between;
    width: 275px;

    .top{
      display: flex;
      flex-direction: column;
      gap: 16px;
    }
  }
}
</style>