import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Home from "../views/Home";
import Test1 from "../views/Test1";
import Test2 from "../views/Test2";

Vue.use(VueRouter);
/*
在这里引用进来的vue 页面才可以用。
在状态管理工具 vuex 里边各vue组件可以进行数据共享，安全。比如把菜单接口返回的数据保存在内。
 */
const routes = [
  //  从router.js那边走到这里，默认path是/，所以渲染Login这个组件.
  // <router-view/> 查看 router/index.js ， 路径是哪个，就展示哪个对应的 Vue 组件。
  {
    path: '/',
    name: 'Login',
    component: Login,
    hidden: true
  }, {
    path: '/home',
    name: 'Home',
    component: Home,
    hidden: true
  }, {
    path: '/home',
    name: '导航一',
    component: Home,
    children:[
      {
        path: '/test1',
        name: '选项一',
        component: Test1
      }, {
        path: '/test2',
        name: '选项二',
        component: Test2
      }
    ]
  },
];

const router = new VueRouter({
  routes
});

export default router
