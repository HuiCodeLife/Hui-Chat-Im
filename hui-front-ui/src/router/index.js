//引入VueRouter
import VueRouter from "vue-router";
import { getToken } from "@/utils/auth";
import store from "../store";

import Login from "../views/Login";
import Layout from "../layout/Layout";
import ChatList from "../views/chatlist/ChatList";
import ChatFriends from "../views/chatfriends/ChatFriends";
import { Message } from 'element-ui'


const router = new VueRouter({
  routes: [
    {
      name: "Login",
      path: "/login",
      component: Login,
    },

    {
      path: "/",
      component: Layout,
      redirect: "/chat-list",
      children: [
        {
          name: "ChatList",

          path: "/chat-list",
          component: ChatList,
        },
        {
          name: "ChatFriends",
          path: "/chat-friends",
          component: ChatFriends,
        }
      ],
    },
  ],
});

router.beforeEach((to, from, next) => {
  const token = getToken();
  if (to.name !== "Login" && !token) {
    Message({ message: '请先登陆', type: 'error' })
    next("/login");
  } else {
    if (!store.user && token) {
      store.dispatch('GetInfo').then(() => {
        next()
      }).catch(() => {
        store.dispatch('LogOut').then(() => {
          next({ path: '/login' })
        })
      })
    } else {
      next()
    }
  }
});
export default router;
