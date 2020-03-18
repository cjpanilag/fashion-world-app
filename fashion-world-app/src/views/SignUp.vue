<template>
    <div class="ion-page">
      <ion-header>
        <ion-toolbar>
          <ion-title>Sign Up</ion-title>
          <ion-buttons slot="start">
              <ion-back-button default-href="/"></ion-back-button>
          </ion-buttons>
        </ion-toolbar>
      </ion-header>

      <ion-content class="ion-padding">
        <SignUpForm v-on:request="makeRequest" />
      </ion-content>
    </div>
</template>

<script>
import SignUpForm from '@/components/SignUpForm'
import { mapActions } from 'vuex'

export default {
    name: 'signup',
    components: {
      SignUpForm
    },
    methods: {
      ...mapActions({
        register: 'auth/register'
      }),

      /**
       * method to handle the request and receive property
       * 
       * @param form
       * @return void
       */
      makeRequest(form) {
          //passing state to the register method 
          this.register(form).then(() => {
          //if success, route user to login form
          this.$router.replace({ name: 'login' })
        }).catch(() => {
          //logging put if something bad happened in the server
          window.console.log("something went wrong...")
        })
      },
    }
}
</script>