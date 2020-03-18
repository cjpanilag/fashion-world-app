<template>
    <div>
        <ion-card class="card">
            <div v-if="show_card == false">
                <ion-card-content>
                    <ion-row>
                        <ion-col size="6">
                            <ion-text>what's your fashion today?</ion-text>
                        </ion-col>
                        <ion-col size="1" offset="4">
                            <ion-fab-button @click.prevent="activate_card" size="small" color="default">
                                <ion-icon name="add"></ion-icon>
                            </ion-fab-button>
                        </ion-col>
                    </ion-row>
                </ion-card-content>
            </div>
            <form v-if="show_card == true">
                <ion-card-header class="post-card-header">
                    <ion-row>
                        <ion-col>
                            <ion-card-title class="post-header-text" color="dark">Post</ion-card-title>
                        </ion-col>
                        <ion-col size="2" offset="6">
                            <ion-fab-button @click.prevent="deactivate_card" size="small" color="deafult">
                                <ion-icon name="close"></ion-icon>
                            </ion-fab-button>
                        </ion-col>
                    </ion-row>
                </ion-card-header>
                <ion-card-content>
                    <ion-row>
                        <ion-col>
                            <ion-input type="text" :value="form.title" @input= "form.title = $event.target.value" name="title" class="title-input" placeholder="Title"></ion-input>
                        </ion-col>
                    </ion-row>
                    <ion-row>
                        <ion-col>
                            <ion-label class="post-label" position="floating">Description. . .</ion-label>
                            <ion-textarea type="text" :value="form.body" @input= "form.body = $event.target.value" name="body"></ion-textarea>
                        </ion-col>
                    </ion-row>
                    <ion-row>
                        <ion-col>
                            <!-- TODO: image preview  -->
                            <img id="imgPost" v-show="hasFile" :src="imageUrl" alt="logo">
                        </ion-col>
                    </ion-row>
                </ion-card-content>
                <ion-card-footer>
                    <ion-row class="card-footer">
                        <ion-col>
                            <ion-button v-show="!hasFile" @click.prevent="pickFile" color="light"> 
                                <ion-icon name="image"></ion-icon>
                                <ion-text>Image</ion-text>
                            </ion-button>
                            <ion-button @click.prevent="upload" v-show="hasFile" color="light"> 
                                <ion-icon color="success" name="checkbox"></ion-icon>
                                <ion-text>Upload</ion-text>
                            </ion-button>
                        </ion-col>
                        <ion-col>
                            <ion-button @click.prevent="clearImg" v-show="hasFile" color="light"> 
                                <ion-icon color="danger" name="backspace"></ion-icon>
                                <ion-text>Cancel</ion-text>
                            </ion-button>
                        </ion-col>
                        <!-- TODO: image upload -->
                        <input type="file" style="display : none" ref="fileInput" accept="image/*" @change="onFilePicked">
                    </ion-row>
                </ion-card-footer>
            </form>
            
        </ion-card>
    </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
    name: 'post',
    data() {
        return {
            hasFile : false,
            imageUrl : null,
            show_card : false,
            form : {
                posted_by : null,
                title : null,
                body : null,
                image : null
            }
        }
    },
    methods: {
        ...mapActions({
            createPost: 'posts/createPost',
        }),

        activate_card() {
            this.show_card = true
        },

        deactivate_card() {
            this.show_card = false
            this.clearImg()
        },

        pickFile() {    
            this.$refs.fileInput.click()
        },

        onFilePicked(event) {
            const file = event.target.files
            let filename = file[0].name
            
            if(filename.lastIndexOf('.') <= 0) {
                window.console.log('not a valid file') // TODO: make a alert box
            }

            const fileReader = new FileReader()
            fileReader.addEventListener('load', () => {
                this.imageUrl = fileReader.result //this is base64 
                this.hasFile = true
            })
            fileReader.readAsDataURL(file[0])
        },

        upload() {
            this.form.posted_by = localStorage.getItem('id')
            this.form.image = this.imageUrl

            if(this.createPost(this.form)) {
                this.$router.go(0)
                this.hasFile = false
            }
        },

        clearImg() {
            this.imageUrl = null
            this.form.title = null
            this.form.body = null
            this.hasFile = false
        }
    }
}
</script>

<style>
    #imgPost {
        height: 30vh;
        width: 30vh;
        border: 4px dashed#DBDBDB;
    }
    .card {
        border-top: 0.9px solid#DBDBDB;
        margin: 2px;
    }
    .post-card-header {
        padding-top: 2px;
        padding-bottom: 0;
        border-bottom: 0.9px solid#DBDBDB;
    }
    .title-input {
        margin-bottom: 10px;
        font-size: 25px;
        border-bottom: 0.5px solid#DBDBDB;
    }
    .post-label {
        font-style: 15px;
    }
    .post-header-text {
        padding-top: 5px;
        font-size: 45px;
    }
    .card-footer {
        border-top: 0.9px solid#DBDBDB;
        padding: 10px;
    }
</style>