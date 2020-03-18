<template>
    <div class="ion-page">
      <ion-header>
        <ion-toolbar>
          <ion-title>Login</ion-title>
          <ion-buttons slot="start">
              <ion-back-button default-href="/"></ion-back-button>
          </ion-buttons>
        </ion-toolbar>
      </ion-header>

      <ion-content class="ion-padding">
        <LoginForm v-on:request="makeRequest" />
      </ion-content>
    </div>
</template>

<script>
import LoginForm from '@/components/LoginForm'
import { mapActions } from 'vuex'

export default {
    name: 'login',
    components: {
        LoginForm
    },
    methods: {
      ...mapActions({
        login: 'auth/login'
      }),

      makeRequest(form) {
        this.login(form).then(() => { 
          //if the user is authenticated -> redirect
          this.$router.replace({ name: 'timeline' })
        }).catch(() => {
          //temporary error handling
          this.showAlert('Access denied!') 
        })
      },

      showAlert(msg) {
        return this.$ionic.alertController
          .create({
            header: "Default Message",
            message: msg, 
            buttons: ["OK"]
          })
        .then(a => a.present());
      }
    },
}
</script>