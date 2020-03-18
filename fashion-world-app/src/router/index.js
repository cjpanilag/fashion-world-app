import Vue from 'vue'
import {IonicVueRouter} from '@ionic/vue'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import SignUp from '../views/SignUp.vue'
import Timeline from '../views/Timeline.vue'
import Favorites from '../views/Favorites.vue'
import Profile from '../views/Profile.vue'
import Settings from '../views/Settings.vue'
import store from '@/store'


Vue.use(IonicVueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    beforeEnter: (to, from, next) => {
      if(store.getters['auth/authenticated']) {
        return next({
          name: 'timeline'
        })
      }
      next()
    }
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    beforeEnter: (to, from, next) => {
      if(store.getters['auth/authenticated']) {
        return next({
          name: 'timeline'
        })
      }
      next()
    }
  },
  {
    path: '/signup',
    name: 'signup',
    component: SignUp,
    beforeEnter: (to, from, next) => {
      if(store.getters['auth/authenticated']) {
        return next({
          name: 'timeline'
        })
      }
      next()
    }
  },
  {
    path: '/timeline',
    name: 'timeline',
    component: Timeline,
    beforeEnter: (to, from, next) => {
      if(!store.getters['auth/authenticated']) {
        return next({
          name: 'login'
        })
      }
      next()
    }
  },
  {
    path: '/favorites',
    name: 'favorites',
    component: Favorites,
    beforeEnter: (to, from, next) => {
      if(!store.getters['auth/authenticated']) {
        return next({
          name: 'login'
        })
      }
      next()
    }
  },
  {
    path: '/profile',
    name: 'profile',
    component: Profile,
    beforeEnter: (to, from, next) => {
      if(!store.getters['auth/authenticated']) {
        return next({
          name: 'login'
        })
      }
      next()
    }
  },
  {
    path: '/settings',
    name: 'settings',
    component: Settings,
    beforeEnter: (to, from, next) => {
      if(!store.getters['auth/authenticated']) {
        return next({
          name: 'login'
        })
      }
      next()
    }
  }
]

const router = new IonicVueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router