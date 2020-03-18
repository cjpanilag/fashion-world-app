import Vue from 'vue'
import App from './App.vue'
import router from './router'
import Ionic from '@ionic/vue'
import '@ionic/core/css/ionic.bundle.css'
import axios from 'axios'
import store from './store'

Vue.use(Ionic)

//referencing subscriber for header default config
require('@/store/subscriber')

//global API URL
//axios.defaults.baseURL = 'http://fashion-world-app.com/api/'
axios.defaults.baseURL = 'http://localhost/fashion-world-api/public/api/'

Vue.config.productionTip = false

store.dispatch('auth/attempt', localStorage.getItem('token')).then(() => {
  new Vue({
    store,
    router,
    render: h => h(App)
  }).$mount('#app')
})


