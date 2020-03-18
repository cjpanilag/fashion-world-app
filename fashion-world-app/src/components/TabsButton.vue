<template>
    <div class="ion-page">
        <ion-tab-bar class="tabs">
            <ion-tab-button id="timeline" @click="toTimeline" tab="home">
                <!-- <ion-label>Timeline</ion-label> -->
                <ion-icon name="home"></ion-icon>
            </ion-tab-button>
            <ion-tab-button id="favorites" @click="toFavorites" tab="favorites">
                <!-- <ion-label>Favorites</ion-label> -->
                <ion-icon name="star"></ion-icon>
            </ion-tab-button>
            <ion-tab-button @click="toProfile" tab="Profile">
                <!-- <ion-label>Profile</ion-label> -->
                <ion-icon name="person"></ion-icon>
            </ion-tab-button>
            <ion-tab-button @click="toNotification" tab="notification">
                <!-- <ion-label>Profile</ion-label> -->
                <ion-icon name="settings"></ion-icon>
            </ion-tab-button>
        </ion-tab-bar>
    </div>
</template>

<script>
export default {
    name: 'tabsbutton',
    methods: {
    
        toTimeline() {
            this.$router.push({name: 'timeline'})
        },

        toFavorites() {
            this.$router.push({name: 'favorites'})
        },

        toProfile() {
            this.$router.push({name: 'profile'})
        },

        toNotification() {
            this.$router.push({name: 'settings'})
        }

    }
}
</script>

<style>
    .tabs {
        padding: 5px;
    }
</style>