<template>
  <section class="container">
    <div>
      <h1 class="title">
        {{ cat.category_title }}
      </h1>
      <p v-html="cat.category_desc" />
      <div class="flex-container">
        <div 
          v-for="piggy in pig"
          class="flex-item"
        >
          <nuxt-link :to="'/' + piggy.request">
            <img
              :src="piggy.image"
              style="max-width: 100%; margin:15px;"
            >
          </nuxt-link>
          <h2>{{ piggy.name }}</h2>
        </div>
      </div>
    </div>
  </section>
</template>
<style>
.flex-container {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  align-content: stretch;
  align-items: flex-start;
}
.flex-item {
  order: 0;
  flex: 0 1 auto;
  align-self: auto;
}
</style>

<script>
export default {
  name: 'CategoryPage',
  props: {
    cat: {
      type: Object,
      default: null
    },
    pig: {
      type: Array,
      default: null
    },
    route: {
      type: Array,
      default: null
    }
  }
}
</script>
