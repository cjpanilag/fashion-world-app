<template v-if="authenticated">
    <div>
        <ion-card v-for="post in posts" :key="post.id" class="card">
            <ion-card-header class="post-header">
                <ion-card-subtitle>
                    <ion-row>
                        <ion-col size="2">
                            <ion-avatar size="small">
                                <img v-show="post.user_image" :src="post.user_image">
                                <img v-show="!post.user_image" src="@/assets/profile/default.jpg">
                            </ion-avatar>
                        </ion-col>
                        <ion-col class="col-2" size="9">
                            <ion-label color="primary">
                                <h6>{{post.posted_by}}</h6>
                            </ion-label>
                            <ion-text color="dark">
                                <h3>{{post.title}}</h3>
                            </ion-text>
                            <ion-label><h6>{{post.created_at}}</h6></ion-label>
                        </ion-col>
                    </ion-row>
                </ion-card-subtitle>
            </ion-card-header>
            <ion-item>
                <img v-show="post.image" id="img-post" :src="post.image" /> 
                <img v-show="!post.image" id="img-post" src="@/assets/logo.png" />    
            </ion-item>
            <ion-card-content>
                <ion-row class="content-row">
                    <ion-col>
                        <ion-row class="content-row-1">
                            <ion-col size="1">
                                <ion-icon v-if="hasClick === post.id || post.liked === true" @click="unclick(post)" color="danger" size="large" name="heart"></ion-icon>
                                <ion-icon v-else @click="clickPost(post)" color="danger" size="large" name="heart-empty"></ion-icon>
                            </ion-col>
                            <ion-col class="content-col-2">
                                <ion-label>
                                    <h2>{{post.countedLikes}}</h2>
                                </ion-label>
                            </ion-col>
                        </ion-row>
                    </ion-col>
                </ion-row>
                <ion-row>
                    <ion-text>
                        <h1>Description</h1>
                    </ion-text>
                </ion-row>
                <ion-row>
                    <ion-text>
                        <h3>{{post.body}}</h3>
                    </ion-text>
                </ion-row>
            </ion-card-content>
        </ion-card>
    </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex' 

export default {
    name : 'posted',
    data() {
        return {
            hasClick: null,
            post_id: null,
        }
    },
    computed: {
        ...mapGetters({
            authenticated: 'auth/authenticated',
            posts: 'posts/posts',
        }),
    },
    created() {
        this.allPosts()
    },
    methods: {
        ...mapActions({
            allPosts: 'posts/allPosts',
            likePost: 'posts/likePost',
            unlike: 'posts/unlike'
        }),

        clickPost(post) {
            this.hasClick = post.id
            this.likePost(post).then((response) => {
                if(response.status == 200) {
                    post.countedLikes++
                    window.console.log(response.data)
                }
            })
        },

        unclick(post) {
            this.hasClick = null
            this.unlike(post).then((response) => {
                if(response.status == 200) {
                    post.liked = false
                    post.countedLikes--
                    window.console.log(response.data)
                }
            })
        }
    }
}
</script>

<style>
    .card {
        margin: 2px;
        border: 1px solid#DBDBDB;
    }
    .post-header {
        border-bottom: 1px solid#DBDBDB;
    }
    .col-2 h3 {
        margin: 0;
    }
    .content-row {
        margin-bottom: 5px;
    }
    .card-subtitle {
        padding-bottom: 5px;
    }
    .content-col-2 {
        padding: 5px;
    }
    #img-post {
        height: 50vh;
        padding: 5px;
    }
</style>