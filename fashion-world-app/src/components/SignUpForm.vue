<template>
    <ion-grid>
        <ion-col>
            <img class="home-img" alt="logo" height="140px" src="../assets/logo.png">
        </ion-col>
        <form @submit.prevent="onSubmit">
            <ion-col>
                <ion-item>
                    <ion-label position="floating">Username</ion-label>
                    <ion-input @keyup="nameValidator" type="text" :value="form.name" @input= "form.name = $event.target.value" name="name"></ion-input>
                    <ion-icon name="person" slot="end"></ion-icon>
                </ion-item>
                <div v-if="nameStatus" class="ion-padding">
                    <ion-text color="danger"> {{ nameStatus }} </ion-text>
                </div>
                <ion-item>
                    <ion-label position="floating">Email</ion-label>
                    <ion-input @keyup="emailValidator" type="email" :value="form.email" @input= "form.email = $event.target.value" name="email"></ion-input>
                    <ion-icon name="mail" slot="end"></ion-icon>
                </ion-item>
                <div v-if="emailStatus" class="ion-padding">
                    <ion-text color="danger"> {{ emailStatus }} </ion-text>
                </div>
                <ion-item>
                    <ion-label position="floating">Password</ion-label>
                    <ion-input type="password" :value="init_password" @input= "init_password = $event.target.value" name="init_password"></ion-input>
                    <ion-icon name="unlock" slot="end"></ion-icon>
                </ion-item>
                <ion-item>
                    <ion-label position="floating">Confirm Password</ion-label>
                    <ion-input type="password" :value="c_password" @input= "c_password = $event.target.value" name="c_password"></ion-input>
                    <ion-icon name="checkmark-circle" slot="end"></ion-icon>
                </ion-item>
                <div v-if="passStatus" class="ion-padding">
                    <ion-text color="danger"> {{ passStatus }} </ion-text>
                </div>
            </ion-col>
            <ion-col>
                <ion-button type="submit" class="btn" color="tertiary" size="large" expand="block">Continue</ion-button>
            </ion-col>
        </form>
    </ion-grid>
</template>

<script>
import axios from 'axios'

export default {
    name: 'SignUpForm',
    data() {
        return {
            init_password: null,
            c_password: null,
            nameStatus: null,
            emailStatus: null,
            passStatus: null,
            confirmName: true,
            confirmEmail: true,
            nameReg: /^[a-z\s]{0,255}$/i,
            emailReg: /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
            form: {
                name: '',
                email: '',
                password: '',
            }
        }
    },
    methods: {
        /**
         * method triggered when button is click
         * form data submitted to the server after
         * passing the validation.
         * 
         * @param null
         * @event submit
         * @return void
         */
        onSubmit() {
            this.clear()
            // if name is empty
            if(!this.form.name) {
                this.nameStatus = "Name can not be empty..."
            }
            // if email is empty
            if(!this.form.email) {
                this.emailStatus = "Email can not be empty..."
            }
            // if password dont match..
            if(this.init_password != this.c_password) {
                this.passStatus = "Password not match"
            } else if(!this.init_password || !this.c_password) {
                this.passStatus = "Password can not be empty..."
            } 
            // if input passed all validation without error
            if(this.form.name && this.form.email &&  this.confirmName == true && this.confirmEmail == true && this.init_password == this.c_password) {
                this.form.password = this.init_password //setting password if match
                this.$emit("request", this.form) //emitting the form data to the parent component
            } 
        },

        /**
         * comparing name input to REGEX 
         * 
         * @event keyup
         * @result set status to not valid if user will input number symbol
         */
        nameValidator() {
            this.nameStatus = null
            if(!this.nameReg.test(this.form.name)) {
                this.nameStatus = "Not a valid name..."
                this.confirmName = false
            } else 
                this.confirmName = true
        },

        /**
         * comparing email input to REGEX
         * 
         * @event keyup
         * @result set status to not valid if user will input invalid email
         */
        emailValidator() {
            this.emailStatus = null
            this.getEmail(this.form)
            if(!this.emailReg.test(this.form.email)) {
                this.emailStatus = "Email is not valid..."
                this.confirmEmail = false
            } else 
                this.confirmEmail = true
        },

        /**
         * sending email validation to the server
         * to check if the input email is exiting or not...
         * 
         * @request GET 
         * @param {*} data
         * @return response
         */
        async getEmail(data) {
            await axios.post('auth/emailchecker', data).then((response) => {
                if(response.data == "not available") {
                    this.emailStatus = "Email already been taken..."
                    this.confirmEmail = false
                }
            })
        },

        /**
         * method to clear all status
         */ 
        clear() {
            this.nameStatus = null
            this.emailStatus = null
            this.passStatus = null
        }
    },
}
</script>

<style scoped>
    .btn {
        margin-top: 20px;
    }
</style>