<template>
    <div class="ion-page">
        <ion-header>
            <ion-toolbar>
                <ion-title>Trends</ion-title>
                <ion-buttons slot="start">
                    <ion-back-button default-href="timeline"></ion-back-button>
                </ion-buttons>
            </ion-toolbar>
        </ion-header>

        <ion-content>
            <FavoritesList />
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
import FavoritesList from '@/components/FavoritesList'

export default {
    name: 'favorites',
    components: {
        TabsButton, FavoritesList
    }
}
</script>