<template>
  <nav class="routes">
    <NuxtLink
      v-for="route in sortedRoutes"
      class="route"
      :class="{ active: isRouteActive(route) }"
      :key="route.path"
      :to="route.path"
    >
      <div class="content">
        <div class="flex">
          <img
            :src="`/icons/route/${getIconState(route)}-${getRouteName(route)}.svg`"
            :alt="getRouteName(route)"
            :class="[getRouteName(route), { active: isRouteActive(route) }]"
            class="icon"
          />
          <div>
            <span>{{ getRouteName(route) }}</span>
          </div>
        </div>
      </div>
    </NuxtLink>
  </nav>
</template>

<script setup lang="ts">
import { useRouter, RouteRecordRaw } from 'vue-router'

// Route Sorting
const sortRoutes = (routes: RouteRecordRaw[]): RouteRecordRaw[] => {
  const targetOrder = ['home', 'explore', 'notifications', 'messages', 'lists', 'bookmarks', 'verified', 'profile', 'more'];

  return routes.sort((a, b) => {
    const nameA = a.name ? a.name.toString() : '';
    const nameB = b.name ? b.name.toString() : '';

    const indexA = targetOrder.indexOf(nameA);
    const indexB = targetOrder.indexOf(nameB);

    return indexA - indexB;
  });
};

// Get Routes
const router = useRouter()
const filteredRoutes = router.getRoutes();
const sortedRoutes: RouteRecordRaw[] = sortRoutes(filteredRoutes);

// Index = Home
const getRouteName = (route: RouteRecordRaw): string => {
  if (route.name === 'index') {
    return 'home';
  }
  return route.name ? String(route.name) : '';
};

// Is router active or not
const isRouteActive = (route: RouteRecordRaw): boolean => {
  return route.path === router.currentRoute.value.path;
};

// Is icon filled or not
const getIconState = (route: RouteRecordRaw): string => {
  return isRouteActive(route) ? 'active' : 'default';
};
</script>

<style scoped lang="scss">
  .routes{
    display: flex;
    flex-direction: column;
    width: 275px;

    .route{
      padding: 4px 0;
      width: 100%;

      .content{
        display: inline-block;
        width: 100%;

        .flex{
          display: flex;
          align-items: stretch;
          padding: 12px;
          border-radius: 9999px;
          margin: 0;

          .icon{
            margin: auto 0;
            max-height: 24px;
            aspect-ratio: 1 / 1;
            filter: var(--icon-foreground);
          }

          div{
            display: block;

            span{
              text-transform: capitalize;
              font-size: 20px;
              text-align: center;
              padding: 0 16px 0 20px;
            }
          }

          &:hover{
            background-color: var(--hover-bg);
          }
        }
      }
    }

    .router-link-active{

      span{
        font-weight: 700;
      }
    }
  }
</style>