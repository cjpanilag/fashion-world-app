<template>
    <div>
        <div class="ion-margin-bottom">
            <img class="home-img" alt="logo" height="140px" src="../assets/logo.png">
        </div>
        <div>
            <form @keyup="clear" @submit.prevent="onSubmit">
                <ion-item>
                    <ion-label position="floating">Email</ion-label>
                    <ion-input type="email" :value="form.email" @input= "form.email = $event.target.value" name="email"></ion-input>
                    <ion-icon name="mail" slot="end"></ion-icon>
                </ion-item>
                <div v-if="emailStatus" class="ion-padding">
                    <ion-text color="danger"> {{ emailStatus }} </ion-text>
                </div>
                <ion-item>
                    <ion-label position="floating">Password</ion-label>
                    <ion-input :value="form.password" @input= "form.password = $event.target.value" name="password" type="password"></ion-input>
                    <ion-icon name="unlock" slot="end"></ion-icon>
                </ion-item>
                <div v-if="passStatus" class="ion-padding">
                    <ion-text color="danger">{{ passStatus }}</ion-text>
                </div>
                <div class="ion-margin-top">
                    <ion-button type="submit" color="tertiary" size="large" expand="block">Continue</ion-button>
                </div>
            </form>
        </div>
    </div>
</template> 

<script>
export default {
    name: 'loginform',
    data() {
        return {
            emailStatus: null,
            passStatus: null,
            form: {
                email: null,
                password: null
            }
        }
    },

    methods: {
        /**
         * method triggered when button is click
         * 
         * @param null
         * @return void
         */
        onSubmit() {
            this.emailStatus = null
            this.passStatus = null

            // if the form is has a value
            if(this.form.email && this.form.password)
                this.$emit("request", this.form)
            // if email is null
            if(!this.form.email) 
                this.emailStatus = "Email is empty..."
            // if password is null
            if(!this.form.password)
                this.passStatus = "Password is empty..."
        },

        clear() {
            if(this.form.email)
                this.emailStatus = null

            if(this.form.password)
                this.passStatus = null
        }
    },

    
}
</script>