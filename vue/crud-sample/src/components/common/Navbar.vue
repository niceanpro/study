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
  <div>
    <header class="header">
      <ul class="title">
        <button
          type="button"
          class="drawer-toggle drawer-hamburger"
          @click="toggleDrawer"
        >
          <span class="drawer-hamburger-icon"></span>
        </button>
        <div><router-link to="/index">Shopping Mall</router-link></div>
      </ul>
      <ul v-for="shopMenu in shopMenus" :key="shopMenu" class="shop-menu">
        <li>{{ shopMenu }}</li>
      </ul>
      <ul v-for="mgmtMenu in mgmtMenus" :key="mgmtMenu.name">
        <li>
          <router-link :to="mgmtMenu.link">{{ mgmtMenu.name }}</router-link>
        </li>
      </ul>
    </header>
    <drawer :drawerFlagProp="drawerFlag"></drawer>
  </div>
</template>

<script>
import Drawer from "./Drawer.vue";

export default {
  components: {
    Drawer
  },
  data() {
    return {
      drawerFlag: false,
      shopMenus: ["오늘배송", "베스트", "이벤트"],
      mgmtMenus: [
        { name: "고객센터", link: "#" },
        { name: "상품관리", link: "/productMgmt/productList" }
      ]
    };
  },
  methods: {
    toggleDrawer() {
      this.drawerFlag = !this.drawerFlag;
    }
  }
};
</script>

<style lang="scss" scoped>
.header a:hover,
.aside a:hover {
  color: rgb(161, 213, 227);
  text-decoration: none;
}

.header {
  height: 45px;
  background-color: white;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  border-style: solid;
  border-color: whitesmoke;
  border-width: thin;
  font-size: 16px;

  .title {
    padding-left: 0px;

    div {
      padding-left: 5px;
      margin-top: 4px;
      font-size: 23px;
    }
  }

  ul {
    display: flex;
    flex-wrap: nowrap;
    align-items: center;
    list-style: none;
    margin-top: 10px;

    img {
      width: 20px;
    }

    li {
      margin: 0 20px;
    }
  }
}

.shop-menu li {
  padding-left: 8rem;
}

.drawer-hamburger {
  position: static !important;
  z-index: 0 !important;
}

.drawer-toggle.drawer-hamburger {
  margin-top: 6px;
  width: 23px;
}

a {
  color: black;
}
</style>


