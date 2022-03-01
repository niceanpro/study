import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import 'bootstrap/dist/js/bootstrap.min.js';
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css';
import '../src/assets/css/datepicker_main.css';
import '../src/assets/css/datepicker.css';
import '../src/assets/css/style.css';

import Vue from 'vue'
import App from './App.vue'
import router from "./router/index.js";

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue';
import VueSidebarMenu from 'vue-sidebar-menu';

Vue.config.productionTip = false
Vue.use(BootstrapVue);
Vue.use(IconsPlugin);
Vue.use(VueSidebarMenu);

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
