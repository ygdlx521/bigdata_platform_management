import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Home from "../views/Home";

Vue.use(VueRouter)
/*
在这里引用进来的vue 页面才可以用。
 */
const routes = [
  //  从router.js那边走到这里，默认path是/，所以渲染Login这个组件.
  // <router-view/> 查看 router/index.js ， 路径是哪个，就展示哪个对应的 Vue 组件。
  {
    path: '/',
    name: 'Login',
    component: Login
  }, {
    path: '/home',
    name: 'Home',
    component: Home
  }
]

const router = new VueRouter({
  routes
})

export default router
