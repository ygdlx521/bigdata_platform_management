import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store(
    {
        state:{
            routers:[]
        },
        mutations:{
            initRouters(state, data){
                state.routers = data;
            }
        },
        actions:{

        }
    }
)