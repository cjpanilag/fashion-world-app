<template>
    <div class="ion-page">
        <ion-header>
            <ion-toolbar>
                <ion-title>Profile</ion-title>
                <ion-buttons slot="start">
                    <ion-back-button default-href="timeline"></ion-back-button>
                </ion-buttons>
            </ion-toolbar>
        </ion-header>

        <ion-content>
            <UserProfile />
            <UserProfileContent />
        </ion-content>

        <ion-footer>
            <ion-toolbar>
                <TabsButton />
            </ion-toolbar>
        </ion-footer>
    </div>
</template>

<script>
import TabsButton from '@/components/TabsButton'
import UserProfile from '@/components/profile/UserProfile'
import UserProfileContent from '@/components/profile/UserProfileContent'

export default {
    name: 'profile',
    components: {
        TabsButton, UserProfile, UserProfileContent
    }
}
</script>