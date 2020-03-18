import axios from 'axios'

export default {
    namespaced: true,

    state: {
        image : null,
        hasImage : false
    },

    getters: {
        image(state) {
            return state.image
        },

        hasImage(state) {
            return state.hasImage
        }
    },

    mutations: {
        SET_IMAGE(state, image) {
            state.image = image
        },

        SET_IMAGE_STATUS(state, status) {
            state.hasImage = status
        }
    },

    actions: {
        async saveImage(_, imageUrl) {
            const id = localStorage.getItem('id')
            const data = {
                'id' : id,
                'image' : imageUrl
            }
            const response = await axios.post('auth/saveimage', data)
            window.console.log(response.data)
        },

        async getImage({commit}) {
            const id = localStorage.getItem('id')
            const response = await axios.get('auth/profileimage/' + id)
            if(response.data != 'no image') {
                commit('SET_IMAGE', response.data)
                commit('SET_IMAGE_STATUS', true)
            }
        }
    }
}