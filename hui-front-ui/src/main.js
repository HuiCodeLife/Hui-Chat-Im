import Vue from 'vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import VueRouter from 'vue-router';
import App from './App.vue'

import router from './router'
//引入store
import store from './store'

import './assets/css/global.css'
// import './assets/css/normalize.css'
import './assets/fonts/iconfont.css'
Vue.config.productionTip = false
Vue.use(ElementUI);
Vue.use(VueRouter);

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')
