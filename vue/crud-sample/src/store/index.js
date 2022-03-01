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
import Vuex from "vuex";
import { mutations } from "./mutations/index.js";
import { actions } from "./actions/index.js";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
  },
  mutations,
  actions,
  modules: {}
});
