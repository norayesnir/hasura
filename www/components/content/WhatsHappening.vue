<template>
  <div class="whats-happening">
    <div class="user-pp">
      <img v-if="users?.users[1].image.length" :src="users?.users[1].image" alt="user-pp">
      <img v-else src="/user-pp_placeholder.png" alt="user-pp">
    </div>
    <ContentSubmitTweet />
  </div>
</template>

<script setup lang="ts">
interface User {
    image: string
  }

  interface getUsers {
    users: User[]
  }

  // fetch users
  const { data: users } = await useFetch<getUsers>('http://localhost:8080/api/rest/users', {
    headers: {
      'content-type': 'application/json',
      'x-hasura-admin-secret': 'e76F2OjO7SJnxjwVMnSNeH1WP4QNFfHs7iO2Ckd8bcRfl6lPtK3hOn7FsqD58u4H',
    }
  }).catch();
</script>