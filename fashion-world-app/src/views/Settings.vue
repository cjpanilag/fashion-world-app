<template>
    <div class="ion-page">
        <ion-header>
            <ion-toolbar>
                <ion-title>Settings</ion-title>
                <ion-buttons slot="start">
                    <ion-back-button default-href="timeline"></ion-back-button>
                </ion-buttons>
            </ion-toolbar>
        </ion-header>

        <ion-content>
            <Logout />
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
import Logout from '@/components/Logout'


export default {
    name: 'settings',
    components: {
        TabsButton, Logout
    }
}
</script>