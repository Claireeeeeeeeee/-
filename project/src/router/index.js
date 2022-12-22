import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import login from "@/views/login";
import register from "@/views/register";
import main_customer from "@/views/main_customer";
import main_employee from "@/views/main_employee";
import frontManagement from "@/components/frontManagement";
import onlineManegement from "@/components/onlineManegement";
import pendingOrders from "@/components/pendingOrders";
import roomstatus from "@/components/roomstatus";
import selectroom from "@/components/selectroom";
import {order} from "../../sever/sqlmap";
import orderselect from "@/components/orderselect";

import historypresent from "@/components/historypresent";
import employee_update from "@/components/employee_update";
import employee_manage from "@/components/employee_manage";
import main_manager from "@/views/main_manager";
import presentManagement from "@/components/presentManagement";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/login',
    name: 'login',
    component: login
  },
  {
    path: '/register',
    name: 'register',
    component: register
  },
  {
    path: '/main_manager',
    name: 'main_manager',
    component: main_manager,
    children: [
      {
        path: '/employee_manage',
        name: 'employee_manage',
        component:employee_manage
      },
      {
        path: '/employee_update',
        name: 'employee_update',
        component:employee_update
      },
    ]
  },

  {
    path: '/main_customer',
    name: 'main_customer',
    component: main_customer,
    children: [
      {
        path: '/selectroom',
        name: 'selectroom',
        component:selectroom
      },
      {
        path: '/orderselect',
        name: 'orderselect',
        component:orderselect
      },
      {
        path: '/historypresent',
        name: 'historypresent',
        component:historypresent
      },
    ]
  },
  {
    path: '/main_employee',
    name: 'main_employee',
    component: main_employee,
    children:[
      {
        path: '/roomstatus',
        name: 'roomstatus',
        component:roomstatus
      },
      {
        path: '/frontManagement',
        name: 'frontManagement',
        component:frontManagement
      },
      {
        path: '/onlineManagement',
        name: 'onlineManagement',
        component:onlineManegement
      },
      {
        path: '/pendingOrders',
        name: 'pendingOrders',
        component:pendingOrders
      },
      {
        path: '/presentManagement',
        name: 'presentManagement',
        component:presentManagement
      },
    ]
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
