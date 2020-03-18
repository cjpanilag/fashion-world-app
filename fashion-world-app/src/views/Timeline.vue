<template v-if="authenticated">
    <div class="ion-page">
        <ion-header>
            <ion-toolbar>
                <img class="myicon" src="@/assets/myicon.png" alt="logo" slot="start">
                <ion-text color="medium" slot="end">{{user.email}}</ion-text>
                <img v-if="image_status == true" slot="end" class="header-img" :src="actual_image.image" alt="logo">
                <img v-if="image_status == false" slot="end" class="header-img" src="@/assets/profile/default.jpg" alt="logo">
            </ion-toolbar>
        </ion-header>

        <ion-content>
            <Post />
            <Posted />
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
import Post from '@/components/post/Post'
import Posted from '@/components/post/Posted'
import { mapGetters, mapActions } from 'vuex'

export default {
    name: 'timeline',
    components: {
        TabsButton, Posted, Post
    },
    created() {
        this.getImage()
    },
    computed:mapGetters({
        authenticated: 'auth/authenticated',
        user: 'auth/user',
        actual_image: 'images/image',
        image_status: 'images/hasImage',
    }),
    methods: {
        ...mapActions({
            getImage: 'images/getImage',
        }),
    }
}
</script>

<style>
    .myicon {
        height: 30px;
        margin-left: 10px;
        margin-right: 10px;
        padding: 2px;
    }
    .header-img {
        margin-right: 10px;
        height: 35px;
        padding: 0;
        border-radius: 50%;
    }
</style>


