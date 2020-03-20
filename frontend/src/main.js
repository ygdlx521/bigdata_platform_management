import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.config.productionTip = false

//项目打开，首先走这里，渲染App.vue
Vue.use(ElementUI);
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
