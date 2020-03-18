<template v-if="authenticated">
    <div>
        <div>
            <!-- TODO: file preview --> 
            <img v-show="!hasFile && image_status == false" class="default-img" src="@/assets/profile/default.jpg" alt="logo">
            <img v-show="hasFile" @click.prevent="clearImg" class="default-img" :src="imageUrl" alt="logo">
            <div v-if="image_status == true">
                <img v-show="!hasFile && image_status == true" @click.prevent="clearImg" class="default-img" :src="actual_image.image" alt="logo">
            </div>
            <ion-fab vertical="top" horizontal="end" slot="fixed">
                <ion-fab-button @click.prevent="pickFile" v-show="!hasFile" size="small">
                    <ion-icon name="image"></ion-icon>
                </ion-fab-button>
                <ion-fab-button color="success" @click.prevent="save" v-show="hasFile" size="small">
                    <ion-icon name="checkmark"></ion-icon>
                </ion-fab-button>
            </ion-fab>
            <!-- hidden file display type TODO: file upload -->
            <input type="file" style="display : none" ref="fileInput" accept="image/*" @change="onFilePicked">
        </div>

        <div class="ion-text-center">
            <ion-label v-show="!edit_mode" color="default" class="name-label"> {{user.name}} </ion-label>
            <ion-icon v-show="!edit_mode" @click.prevent="edit(true)" color="dark" size="large" name="create"></ion-icon>
           
            <ion-input 
                class="edit_input" type="text" 
                v-show="edit_mode" clearInput :value="user.name"
                @input= "new_name = $event.target.value"
            ></ion-input>
            
            <ion-chip v-show="edit_mode" @click.prevent="save_name" color="primary">
                <ion-icon color="tertiary" name="checkmark-circle"></ion-icon>
                <ion-label>Save</ion-label>
            </ion-chip>
            <ion-chip v-show="edit_mode" @click.prevent="edit(false)" color="danger">
                <ion-icon color="danger" name="close-circle"></ion-icon>
                <ion-label>Cancel</ion-label>
            </ion-chip>
        </div>
                
        <ion-grid class="my-grid">
            <ion-row class="ion-text-center">
                <ion-col>
                    <ion-label color="medium">20k</ion-label>
                </ion-col>  
                <ion-col>
                    <ion-text color="medium">4k</ion-text>
                </ion-col>
                <ion-col>
                    <ion-text color="medium">100</ion-text>
                </ion-col>
            </ion-row>
            <ion-row class="ion-text-center">
                <ion-col>
                    <ion-label color="medium">followers</ion-label>
                </ion-col>
                <ion-col>
                    <ion-text color="medium">following</ion-text>
                </ion-col>
                <ion-col>
                    <ion-text color="medium">posts</ion-text>
                </ion-col>
            </ion-row>
        </ion-grid>
    </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
    name: 'user-profile',
    data() {
        return {
            hasFile : false,
            edit_mode: false,
            imageUrl : null,
            new_name: null
        }
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
            saveImage: 'images/saveImage',
            edit_user: 'auth/edit_user',
        }),

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

        save() {
            this.hasFile = false
            if(this.saveImage(this.imageUrl)) {
                this.$router.go(0)
            }
        },

        save_name() {
            if(this.new_name == null) {
                this.new_name = this.user.name
            }
            this.edit_user(this.new_name).then((response) => {
                if(response.status == 200) {
                    this.$router.go(0)
                    this.new_name = null
                }
            })
        },

        edit(bool) {
            this.edit_mode = bool
            this.new_name = null
        },

        clearImg() {
            this.imageUrl = null
            this.hasFile = false
        }
    }
}
</script>

<style>
    ion-fab {
        padding-top: 9em;
        padding-right: 6em;
        position: absolute;
    }
    ion-col {
        padding: 0;
    }
    .my-grid {
        border-top: 0.9px solid#DBDBDB ;
        border-bottom: 0.9px solid#DBDBDB ;
        margin-top: 20px;
        padding-top: 10px;
    }
    .default-img {
        margin: auto;
        padding: 30px;
        height: 35vh;
        border-radius: 50%;
        display: block;
    }
    .name-label {
        font-size: 30px;
    }
    .row-1 {
        padding: 0;
        margin: 0;
    }
    .row-2 {
        padding: 0;
    }
    .edit_input {
        font-size: 30px;
    }
</style>