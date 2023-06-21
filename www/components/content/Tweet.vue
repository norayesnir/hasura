<template>
  <div class="tweets">
    <div class="tweet" v-for="user in users?.users" :key="user.id">
      <div class="margin">
        <img class="user-pp" src="/user-pp_placeholder.png" alt="user-pp">
        <div class="tweet-content">
          <div class="username">
            <span class="name">{{ user.name }}</span>
            <span class="tag">@TwitterCloneUser · 3h</span>
          </div>
          <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. A aperiam nisi odio nobis dignissimos rerum, eius harum ipsum nam consequuntur aut modi tempore natus voluptatum, nihil molestiae consectetur, explicabo dolor?</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  interface User {
    id: string,
    name: string,
    bio: string,
    profession: string,
    location: string,
    website: string,
    birthday: Date,
    followers: number,
    following: number,
    tweet_id: {
      id: string,
      value: string,
    },
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
  });

  console.log(users)
</script>

<style scoped lang="scss">
.tweets{
  .tweet{
    border-bottom: 1px solid var(--border-color);
    transition: .2s ease;

    .margin{
      margin: 16px;
      display: flex;
      gap: 10px;

      .user-pp{
        width: 40px;
        height: 40px;
        border-radius: 20px;
      }

      .tweet-content{
        display: flex;
        flex-direction: column;
        gap: 10px;
        .username{
          display: flex;
          gap: 8px;

          .name{
            font-weight: bolder;
          }
          .tag{
            color: var(--gray);
          }
        }

        p{
          margin: 0;
          line-height: 1.3;
        }
      }
    }

    &:hover{
      background-color: rgb(255, 255, 255, 0.03);
    }
  }
}
</style>
