<template>
  <section class="container">
    <div>
      <h1 class="title">
        gPiggy
      </h1>
      <h2 class="subtitle">
        Routing Example
      </h2>
      <div class="links">
        <nuxt-link
          to="/good"
          class="button--green"
        >Good Piggies</nuxt-link>
        <nuxt-link
          to="/naughty"
          class="button--grey"
        >Naughty Piggies</nuxt-link>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  head() {
    return {
      title: 'Guinea Pigs Rated',
      meta: [
        {
          hid: 'description',
          name: 'description',
          content: 'All About them piggies'
        },
        {
          hid: 'robots',
          name: 'robots',
          content: 'noindex'
        }
      ]
    }
  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
