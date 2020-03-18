import axios from 'axios'

export default {
    namespaced: true,

    state: {
        token: null,
        id: null,
        user: null,
        email: null,
    },

    getters: {
        authenticated(state) {
            return state.token && state.user
        },

        user(state) {
            return state.user
        },
    },

    mutations: {
        SET_TOKEN(state, token) {
            state.token = token
        },

        SET_USER(state, data) {
            state.user = data 
        },

        SET_ID(state, data) {
            state.id = data
        },
    },

    actions: {
        /**
         * sending post request to API
         * dispatch token to method attempt
         * 
         * @param credentials 
         * @return token
         */
        async login({ dispatch }, credentials) {
            const response = await axios.post('auth/signin', credentials)
            return dispatch('attempt', response.data.token)
        },

        /**
         * sending post request to API
         * register user credentials
         *
         * @param {*} _ 
         * @param {*} credentials 
         */
        async register(_, credentials) {
            const response = await axios.post('auth/register', credentials)
            window.console.log(response.status)
        },

        /**
         * sending get request to API
         * commit mutation to SET_TOKEN
         * commit mutation to SET_USER
         * 
         * @param {*} param0 
         * @param {*} token 
         */
        async attempt({ commit, state }, token) {
            //if the token is null do not commit mutation
            if(token) {
                commit('SET_TOKEN', token)
            }
            //if the state of the token is null
            //don't continue to the request 
            if(!state.token) {
                return
            }
            //invoke request 
            try {
                const response = await axios.get('auth/me')
                commit('SET_USER', response.data)
                commit('SET_ID', response.data.id)
            } catch(e) {
                commit('SET_TOKEN', null)
                commit('SET_USER', null)
                commit('SET_ID', null)
            }
        },

        /**
         * signing out the user 
         * clearing all the state
         * 
         * @param {*} param0 
         */
        logout({ commit }) {
            return axios.post('auth/signout').then(() => {
                commit('SET_TOKEN', null)
                commit('SET_USER', null)
                commit('SET_ID', null)
            })
        },

        /**
         * updating name of the user
         * 
         * @param new_name
         * @return response
         */
        async edit_user(_, name) {
            const id = localStorage.getItem('id')
            const data = { 'user_id': id, 'name': name }
            return await axios.post('auth/edit', data)
        }
    },
}