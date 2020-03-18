<template>
  <div class="ion-page">
    <ion-content class="ion-padding">
      <ion-col>
        <img class="home-img" alt="logo" id="content_logo" src="@/assets/logo.png">
        <ion-text color="">
          <h2 class="home-label">Fashion World</h2>
        </ion-text>
      </ion-col>

      <ion-col>
        <ion-button @click="loginBtn" color="tertiary" size="large" expand="block">Login</ion-button>
        <ion-button @click="signupBtn" color="secondary" size="large" expand="block">Sign Up</ion-button>
      </ion-col>
    </ion-content>
  </div>
</template>

<style>
  .home-img {
    padding-top: 4em;
    width: auto;
    margin: auto;
    display: block;
  }
  .home-label {
    padding-bottom: 10px;
    text-align: center;
  }
</style>

<script>
export default {
  name: 'home',
  data() {
    return {
      //TODO
    }
  },
  methods: {

    loginBtn() {
      //this.showAlert();
      this.$router.push({name: 'login'})
    },
    
    signupBtn() {
      this.$router.push({name: 'signup'})
    },
    
  }
}
</script>

