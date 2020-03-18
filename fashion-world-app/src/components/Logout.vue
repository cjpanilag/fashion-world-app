<template>
    <ion-item @click="logout">
        <ion-text color="danger">
            <h1>Logout</h1>
        </ion-text>
        <ion-icon color="danger" slot="end" name="arrow-forward"></ion-icon>
    </ion-item>
</template>

<script>
import { mapActions } from 'vuex'

export default {
    name: 'logout',
    methods: {
        ...mapActions({ logoutAction: 'auth/logout' }),

        logout() {
            this.logoutAction().then(() => {
                this.$router.replace({ name: 'home' })
                this.$router.go(0)
            })
        },
    }
}
</script>