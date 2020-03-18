import axios from 'axios'

export default {
    namespaced: true,

    state: {
        posts: [],
        post: [],
        trends: []
    },

    getters: {
        posts(state) {
            return state.posts
        },

        post(state) {
            return state.post
        },

        getTrends(state) {
            return state.trends
        }
    },

    mutations: {
        SET_POST(state, posts) {
            state.posts = posts
        },

        SET_SINGLEPOST(state, post) {
            state.post = post
        }, 

        SET_TREND(state, trend){
            state.trends = trend
        }
    },

    actions: {
        /**
         * get all post from the API
         * @param {*} param0 
         */
        async allPosts({commit}) {
            const id = localStorage.getItem('id')
            const response = await axios.get('post/posts/' + id)
            commit('SET_POST', response.data)
        },

        /**
         * get single post from the API
         * @param {*} param0 
         */
        async getPost({commit}) {
            const id = localStorage.getItem('id')
            const response = await axios.get('post/post/' + id)
            commit('SET_SINGLEPOST', response.data)
        },

        /**
         * creating post
         * @param formdata
         */
        async createPost(_, data) {
            const response = await axios.post('post/create', data)
            window.console.log(response.status)
        },

        /**
         * sending POST request to API 
         * invoking update action
         * @param {*} _ 
         * @param {*} data 
         */
        async editAction(_, data) {
            return await axios.post('post/update', data)
        },

        /**
         * sending GET request to API
         * invoking delete action 
         * @param {*} _ 
         * @param {*} id 
         */
        async deleteAction(_, id) {
            return await axios.get('post/delete/' + id)
        },
        
        async likePost(_, data) {
            const newdata = {
                'post_id': data.id,
                'user_id': localStorage.getItem('id')
            }
            return await axios.post('post/like', newdata)
        },

        async unlike(_, data) {
            const newdata = {
                'post_id': data.id,
                'user_id': localStorage.getItem('id')
            }
            return await axios.post('post/unlike', newdata)
        },

        async trends({commit}) {
            const response = await axios.get('post/trends')
            commit('SET_TREND', response.data)
        }
    }
}