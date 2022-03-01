<!--
   AnyX Platform version 1.0

   Copyright ⓒ 2020 anylogic corp. All rights reserved.

   This is a proprietary software of anylogic corp, and you may not use this file except in
   compliance with license agreement with anylogic corp. Any redistribution or use of this
   software, with or without modification shall be strictly prohibited without prior written
   approval of anylogic corp, and the copyright notice above does not evidence any actual or
   intended publication of such software.
-->

<template>
  <div class="dashboard-header">
    <nav class="navbar navbar-expand-lg fixed-top header-color">
      <!--     home index link 넣을 예정       -->
      <a class="navbar-brand" ng-href="#main_index">Anylogic</a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto navbar-right-top">
          <li class="nav-item">
            <!--sungmun-d Search-form 지움 -->
          </li>
          <li
            class="nav-item dropdown notification"
            style="padding-right: 0px; margin-right: 0px"
          >
            <!-- sungmun-d 지움 -->
            <!-- sungmun-c icon 추가 -->
            <svg
              width="1.5em"
              height="2.5em"
              viewBox="0 0 16 16"
              class="bi bi-person-circle"
              fill="currentColor"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"
              />
              <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
              <path
                fill-rule="evenodd"
                d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"
              />
            </svg>
          </li>
          <li
            class="nav-item dropdown connection"
            style="border-right: 1px solid #e6e6f2; padding-top: 6px"
          >
            <!-- sungmun-d 지움 -->
            <!-- sungmun-c  text추가 -->

            <h2 id="nickname">님</h2>
          </li>
          <li class="nav-item dropdown nav-user">
            <!-- sungmun-d 지움-->
            <a
              href="javascript:void(0);"
              class="btn btn-secondary"
              @click="logOut()"
              >로그아웃</a
            >
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>

<script>
// import { API } from "../../api/index.js";

export default {
  name: 'HeaderA',
  data() {
    return {
    };
  },
  computed: {},
  watch: {},
  async created() {},
  mounted() {},
  methods: {
    logOut(){
      
    }
  },
};
</script>

<style lang="scss" scoped>
.header-color {
  background-color: beige;
}
</style>
