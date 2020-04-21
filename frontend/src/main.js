import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from "./store";
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import {postkeyValueRequest, postRequest, putRequest, deleteRequest, getRequest} from "./utils/api";
import {initMenu} from "./utils/menus";
import 'font-awesome/css/font-awesome.min.css'


Vue.config.productionTip = false
/*
vue 插件，避免在用的时候import
 */
Vue.prototype.postkeyValueRequest = postkeyValueRequest;
Vue.prototype.postRequest = postRequest;
Vue.prototype.putRequest = putRequest;
Vue.prototype.deleteRequest = deleteRequest;
Vue.prototype.getRequest = getRequest;

/*
前置路由导航守卫
 */
router.beforeEach((to, from, next) => {
  if (to.path === '/') {
    next();
  }else {
    if (window.sessionStorage.getItem("user")) {
      initMenu(router, store);
      next();
    }else{
      next('/?redirect='+to.path);
    }
  }
});


//项目打开，首先走这里，渲染App.vue
Vue.use(ElementUI);
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
