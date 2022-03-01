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
  <div class="container">
    <slot name="title">Popup Title부분</slot>
  </div>
</template>

<script>
import { conditionBus } from "../../utils/search-condition-bus.js";

export default {
  name : "PopUp",
  data() {
    return {};
  },
  props: {
    cmid: {
      type: Object,
      required : true,
      validator : function(value) {
        return [].indexOf(value) !== -1;
      },
      default() {
        return {};
      }
    },
    cmname: {
      type: Object,
      default() {
        return {};
      }
    },
    cmdesc: {
      type: Object,
      default() {
        return {};
      }
    }
  },
  computed: {},
  watch: {},
  async created() {},
  mounted() {},
  methods: {

    // Event To Parent
    evCountToParent(arg1) {
      conditionBus.$emit("evCount", arg1);
      console.log("emit to parent (evCount)");
    }
  }
};
</script>

<style lang="scss" scoped></style>
