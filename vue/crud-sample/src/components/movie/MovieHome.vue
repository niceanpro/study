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
    <Popup v-bind:cmid="pmid" v-bind:cmname="pmname" v-bind:cmdesc="pmdesc">
      <template v-slot:title>
        <h1>hello</h1>
      </template>
    </Popup>
    <b-pagination
      v-model="selectMovieCond.pageNum"
      :total-rows="selectMovieRows"
      :per-page="selectMovieCond.pageCon"
      aria-controls="example"
      @input="selectMovie(selectMovieCond.pageNum)"
      style="display: flex; justify-content: center;"
    ></b-pagination>
  </div>
</template>

<script>
import { conditionBus } from "../../utils/search-condition-bus.js";
import Popup from "./Popup.vue";
import { API } from "../../api/index.js";

export default {
  components: {
    Popup
  },
  data() {
    return {
      pageInfo: {},
      pmid: {},
      pmname: {},
      pmdesc: {},
      name: "",
      selectMovieList: [],
      selectMovieCond: {
        name: "",
        pageNum: 1,
        pageCon: 10
,
        sortDirection: "ASC",
        sortItem: "id"
      },
      selectMoviePageCon: [10, 25, 50, 100]
    };
  },
  computed: {
    selectMovieRows() {
      if (
        this.selectMovieList != [] &&
        this.selectMovieList[0] != undefined
      ) {
        return this.selectMovieList[0].totalCnt;
      } else {
        return 0;
      }
    },

  },
  watch: {},
  async created() {
    conditionBus._events = {};
    conditionBus.$on("evCount", arg1 => {
      console.log(arg1);
      // To Do
    });
    conditionBus._events = {};
    conditionBus.$on("evCount", arg1 => {
      console.log(arg1);
      // To Do
    });
    if (Object.keys(this.$route.query).length == 0) {
      this.$router
        .replace({
          query: this.movieCond
        })
        .catch(error => {
          console.log(error);
        });
    }
    // to do 
    // this.searchMovieByQuery(name);
    window.onpopstate = () => {
      // to do
      // this.searchMovieByQuery();
    };
  },
  mounted() {
    this.selectMovie(1);
  },
  beforeDestroy() {
    conditionBus.$off("evCount");
    window.onpopstate = null;
  },
  methods: {
    changeSortSelectMovie(header) {
      if (this.selectMovieCond.selectMovieSortItem == header) {
        this.selectMovieCond.selectMovieSortDirection == "ASC" ? "DESC" : "ASC";
      } else {
        this.selectMovieCond.selectMovieSortItem = header;
        this.selectMovieCond.selectMovieSortDirection = "ASC";
      }
      this.selectMovie(this.selectMovieCond.pageNum);
    },
    selectMovieByPageNum(pageNum) {
      this.selectMovieCond.pageNum = pageNum;
      this.$router
        .push({
          query: this.selectMovieCond
        })
        .catch(error => {
          console.log(error);
        });
      this.selectMovie(pageNum);
    },
    // eslint-disable-next-line
    async selectMovie(pageNum) {

      this.selectMovieCond.pageNum = pageNum;

      this.selectMovieCond.name = this.name;

      try {
        const response = await API.movieAPI.selectMovie(this.selectMovieCond);
        this.selectMovieList = response.data.data.rows;
        console.log(response);
      } catch (error) {
        console.log(error);
      }
      // this.$emit("event-name", this.SelectMovie[0].TOTAL_CNT);
    },
    async selectMovieByQuery() {
      this.selectMovieCond = Object.assign({}, this.$route.query);
      try {
        const response = await API.movieAPI.selectMovie(this.selectMovieCond);
        this.selectMovieList = response.data.data.rows;
        console.log(response);
      } catch (error) {
        console.log(error);
      }
      // this.$emit("event-name", this.SelectMovie[0].TOTAL_CNT);
    },
    async excelDownMovie() {
      var excelForm = document.createElement("form");
      excelForm.target = "excelIframe";
      excelForm.method = "POST";
      excelForm.action = "http://192.168.0.86:8580/jihwan/movie/excelDownMovie";
      document.body.appendChild(excelForm);

      const addInput = (form, name, value) => {
        if (
          value == undefined ||
          value == null ||
          value.toString().trim() == ""
        )
          return;
        var t = document.createElement("input");
        form.appendChild(t);
        t.setAttribute("type", "hidden");
        t.setAttribute("name", name);
        t.setAttribute("value", value);
      };

      this.selectMovieCond.name = this.name;

      addInput(
        excelForm,
        "name",
        this.selectMovieCond.name
      );

      addInput(
        excelForm,
        "sortItem",
        this.selectMovieCond.sortItem
      );
      addInput(
        excelForm,
        "sortDirection",
        this.selectMovieCond.sortDirection
      );

      excelForm.submit();
      document.body.removeChild(excelForm);
    },

    // Move Function
    moveToMovieAdd() {
      this.$router.push({
        name: "movieAdd"
      });
    },

    // Move Function
    moveToMovieDetail(item) {
      this.$router.push({
        name: "movieDetail",
        params: {
          sendParam: item
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped></style>
