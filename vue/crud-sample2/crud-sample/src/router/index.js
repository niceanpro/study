/*
   AnyX Platform version 1.0

   Copyright ⓒ 2020 anylogic corp. All rights reserved.

   This is a proprietary software of anylogic corp, and you may not use this file except in
   compliance with license agreement with anylogic corp. Any redistribution or use of this
   software, with or without modification shall be strictly prohibited without prior written
   approval of anylogic corp, and the copyright notice above does not evidence any actual or
   intended publication of such software.
*/

import Vue from "vue";
import VueRouter from "vue-router";
import { projectRoutes } from "./projectRouter.js";

// import { userRoutes } from "./userRouter.js";


Vue.use(VueRouter);

// eslint-disable-next-line
const routes = [ ...projectRoutes];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
