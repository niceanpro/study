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
 <div class="div" style="width: max-content; margin: auto">
    <div class="container-fluid dashboard-content">

      <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
          <div class="page-header">
            <h2 class="pageheader-title" style="background-color: beige; width: max-content;">프로젝트 등록</h2>
            <div class="page-breadcrumb">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <!-- breadcrumb JIWON -D -->
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
    
      <div class="ecommerce-widget">
        <div class="row">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card" id="logtable" style="width: 100%; display: flex;">
              <div class="card-body">
                <form style="float: left; margin-right: 50px">
                  <label style="margin-right: 10px;">프로젝트 이름</label>
                  <input type="text" v-model="projectData.name" />
                  <hr>
                  <label>프로젝트 설명</label><br />
                  <textarea
                    name=""
                    id=""
                    cols="38"
                    rows="5"
                    v-model="projectData.project_desc"
                  ></textarea>

                </form>
              </div>
            </div>

            <div style="width: max-content; margin: auto;">
                    <b-button
                      variant="outline-success"
                      style="margin-right: 10px;"
                      @click="insertProject()"
                    >
                      등록
                    </b-button>
                    <b-button
                      variant="outline-danger"
                      style="margin-right: 10px;"
                      @click="moveToUserProjectHome()"
                    >
                      홈
                    </b-button>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { API } from "../../api/index.js";
import { formatDate } from "../../utils/date.js";

export default {
  data() {
    return {
      projectData: {
        id: "",
        name: "",
        project_desc: "",
        date: "",
      },
    };
  },
  computed: {},
  watch: {},
  async created() {},
  mounted() {},
  methods: {
    async insertProject() {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
      var projectFormData = new FormData();

      ////////////// Date //////////////
      let add_date = new Date();
      add_date = formatDate(add_date);
      this.projectData.date = add_date;
      //////////////////////////////////

      var requiredData = {
        formData: this.projectData
      };
      projectFormData.append("data", JSON.stringify(requiredData));

      API.projectAPI
        .insertProject(projectFormData)
        .then(response => {
          console.log("insertResponse", response);
          if (response.data.responseCode == "OK") {
            alert("정상 등록되었습니다");
            this.moveToUserProjectHome();
          } else {
            alert("Error");
            this.moveToUserProjectHome();
          }
        })
        .catch(error => {
          console.log(error);
        });
    },
    
    moveToUserProjectHome() {
      this.$router.push({
        name: "userProjectHome"
      });
    },
    
  }
};
</script>

<style>
.div {
  padding-top: 50px;
}
</style>
