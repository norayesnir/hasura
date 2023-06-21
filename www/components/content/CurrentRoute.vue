<template>
  <div>
    <h2>{{ getRouteName(router.currentRoute.value) }}</h2>
  </div>
</template>

<script setup lang="ts">
import { useRouter, RouteLocationNormalizedLoaded } from 'vue-router'

const router = useRouter();

const getRouteName = (route: RouteLocationNormalizedLoaded | null): string => {
  if (route && route.name === 'index') {
    return 'home';
  }
  return route && route.name ? String(route.name) : '';
};
</script>

<style scoped lang="scss">
div{
  padding: 0 16px;
  height: 50px;
  display: flex;
  align-items: center;

  h2{
    text-transform: capitalize;
  }
}
</style>