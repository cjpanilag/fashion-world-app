<template>
     <div>
        <ion-item>
            <div>
                <h1>Recently followed</h1>
                <div class="ion-padding">
                    <ion-row>
                        <ion-col>
                            <img class="thumbnail-img" src="@/assets/profile/default.jpg" alt="">
                        </ion-col>
                        <ion-col>
                            <h4 class="thumbnail-title">Name</h4>
                            <ion-label color="medium">date</ion-label>
                        </ion-col>
                    </ion-row>
                </div>
            </div>
        </ion-item>
    </div>
</template>

<script>
export default {
    name: 'following'
}
</script>