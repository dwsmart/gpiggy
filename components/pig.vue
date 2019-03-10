<template>
  <section class="container">
    <div>
      <h1 class="title">
        {{ pig.name }}
      </h1>
       <img
        :src="pig.image"
        style="max-width: 100%; margin:15px;"
      >
      <p v-html="pig.desc" />
    </div>
  </section>
</template>

<script>
export default {
  name: 'PigPage',
  props: {
    pig: {
      type: Object,
      default: null
    }
  }
}
</script>
