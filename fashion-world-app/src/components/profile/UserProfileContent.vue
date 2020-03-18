<template v-if="authenticated">
    <div>
        <div> 
            <ion-card v-for="data in post" :key="data.id" class="card">
                <ion-card-header class="header">
                    <ion-toolbar>
                        <ion-card-title v-if="editing === data.id" color="primary">
                            <ion-input 
                                type="text" 
                                clearInput :value="data.title"
                                @input= "form.title = $event.target.value"
                            ></ion-input>
                        </ion-card-title>
                        <ion-card-title v-else color="dark">{{data.title}}</ion-card-title>
                        
                        <ion-item v-if="editing === data.id" slot="end">
                            <ion-icon @click="save(data.id)" size="large" color="success" name="checkmark-circle"></ion-icon>
                            <ion-icon @click="cancel_edit(data)" size="large" color="danger" name="arrow-dropleft-circle"></ion-icon>
                        </ion-item>
                        <ion-item v-else slot="end">
                            <ion-icon @click="edit_post(data)" color="primary" size="large" name="create"></ion-icon>
                            <ion-icon @click.prevent="delete_post(data.id)" color="danger" size="large" name="close-circle"></ion-icon>
                        </ion-item>
                    </ion-toolbar>
                </ion-card-header>
                <ion-item>
                    <img v-show="data.image" id="img-post" :src="data.image" />
                    <img v-show="!data.image" id="img-post" src="@/assets/logo.png" />    
                </ion-item>
                <ion-card-content>
                    <ion-card-subtitle>{{data.updated_at}}</ion-card-subtitle>
                    <ion-text>
                        <ion-input
                            v-if="editing === data.id"
                            color="primary"
                            type="text" 
                            clearInput :value="data.body"
                            @input= "form.body = $event.target.value"
                        ></ion-input>
                        <h2 v-else>{{data.body}}</h2>
                    </ion-text>
                </ion-card-content> 
            </ion-card>
        </div>
    </div>
</template> 

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
    name: 'user-profile-content',
    data() {
        return {
            editing: null,
            form: {
                title: null,
                body: null
            }
        }
    },
    computed: mapGetters({
        post: 'posts/post'
    }),
    created() {
        this.getPost()
    },
    methods: {
        ...mapActions({
            getPost: 'posts/getPost',
            editAction: 'posts/editAction',
            deleteAction: 'posts/deleteAction'
        }),

        edit_post(post) {
            this.cachedPost = Object.assign({}, post)
            this.editing = post.id
        },

        cancel_edit(post) {
            Object.assign(post, this.cachedPost)
            this.editing = null
        },

        save(id) {
            if(this.form.title == null && this.form.body == null) {
                this.editing = null
                return
            }
            const data = {
                'id': id,
                'title': this.form.title,
                'body': this.form.body
            }
            this.editAction(data).then((response) => {
                if(response.status == 200) {
                    this.$router.go(0)
                }   
            })
        },

        delete_post(id) {
            this.deleteAction(id).then((response) => {
                if(response.status == 200) {
                    this.$router.go(0)
                }
            })
        },
    }
}
</script>

<style scoped>
    .header {
        border-bottom: 0.9px solid#DBDBDB;
    }
</style>