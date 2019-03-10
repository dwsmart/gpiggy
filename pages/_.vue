<template>
  <div>
    <nuxt-link to="/">
      Home
    </nuxt-link>
    <cats 
      v-if="type === 'cat'"
      :cat="cat"
      :pig="pig"
    />
    <pig 
      v-if="type === 'pig'"
      :pig="pig"
    />
  </div>
</template>

<script>
import cats from '~/components/cats'
import pig from '~/components/pig'

export default {
  name: 'DaveRouter',
  components: { cats, pig },
  head() {
    return {
      title: this.title,
      meta: [
        {
          hid: 'description',
          name: 'description',
          content: this.description
        },
        {
          hid: 'robots',
          name: 'robots',
          content: 'noindex'
        }
      ]
    }
  },
  data() {
    return {
      type: 'unknown',
      title: 'Router',
      description: 'description'
    }
  },
  asyncData({ app, params, error, redirect }) {
    return app.$axios
      .$post('https://routing-demo.tamethebots.com/api/route.php', {
        route: params.pathMatch
      })
      .then(function(response) {
        if (response.route.type === 'redirect') {
          redirect('301', '/' + response.route.target)
        } else if (response.route.type === 'cat') {
          return {
            type: response.route.type,
            title: response.route.meta_title,
            description: response.route.meta_description,
            cat: response.cat,
            pig: response.pig
          }
        } else if (response.route.type === 'pig') {
          return {
            type: response.route.type,
            title: response.route.meta_title,
            description: response.route.meta_description,
            pig: response.pig
          }
        }
      })
      .catch(e => {
        error({ statusCode: 404, message: 'Page not found' })
      })
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
