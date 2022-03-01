<template>
  <div id="app">
    <Header></Header>
    <LeftMenu></LeftMenu>
    <router-view></router-view>
  </div>
</template>

<script>
import Header from "../src/components/common/Header.vue";
import LeftMenu from "../src/components/common/LeftMenu.vue";


export default {
  name: 'App',
  components: {
    Header,
    LeftMenu,
  }
}
</script>

<style lang="scss">

</style>
