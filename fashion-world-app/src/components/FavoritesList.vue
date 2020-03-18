<template>
    <ion-list class="list">
        <ion-item v-for="trends in getTrends" :key="trends.post_id">
            <ion-avatar slot="start">
                <img :src="trends.image">
            </ion-avatar>
            <ion-label>
                <h1 id="post-title">{{trends.title}}</h1>
                <h6>
                    Posted By: {{trends.posted_by}} with 
                    {{trends.counted}}
                    <ion-icon  color="danger" name="heart"></ion-icon> 
                </h6>
            </ion-label>
        </ion-item>
    </ion-list>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
    name: 'favorites-list',
    computed: mapGetters({
        getTrends: 'posts/getTrends'
    }),
    created() {
        this.trends()
    },
    methods: {
        ...mapActions({ trends: 'posts/trends' }),
    }
}
</script>