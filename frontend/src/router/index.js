import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'

Vue.use(VueRouter)

const routes = [
  //  从router.js那边走到这里，默认path是/，所以渲染Login这个组件
  {
    path: '/',
    name: 'Login',
    component: Login
  }
]

const router = new VueRouter({
  routes
})

export default router
