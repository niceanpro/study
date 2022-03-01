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
            <h2 class="pageheader-title" style="background-color: beige; width: max-content;">프로젝트 수정</h2>
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
                  <input type="text" v-model="selectOneProjectData.name" />
                  <hr>
                  <label>프로젝트 설명</label><br />
                  <textarea
                    name=""
                    id=""
                    cols="38"
                    rows="5"
                    v-model="selectOneProjectData.project_desc"
                  ></textarea>
                  
                </form>
              </div>
            </div>

            <div style="width: max-content; margin: auto;">
                  <b-button
                    variant="outline-success"
                    style="margin-right: 10px;"
                    @click="updateProject()"
                  >
                    수정
                  </b-button>
                  <b-button
                    variant="outline-danger"
                    style="margin-right: 10px;"
                    @click="moveToUserProjectDetail(selectOneProjectData)"
                  >
                    뒤로가기
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

export default {
  data() {
    return {
      params: {},
      id: "",
      selectOneProjectData: {},
      selectOneProjectCond: {
        id: "",
      }
    };
  },
  computed: {},
  watch: {},
  async created() {
    this.params = this.$route.params;    // to do    // params
    this.id = this.params.sendParam.id;
  },
  mounted() {
    this.selectOneProject();
  },
  methods: {
    // eslint-disable-next-line
    async selectOneProject() {
      this.selectOneProjectCond.id = this.id;

      try {
        const response = await API.projectAPI.selectOneProject(this.selectOneProjectCond);
        this.selectOneProjectData = response.data.data;
      
        console.log("SelectOneProjectUpdate", response);
      } catch (error) {
        console.log(error);
      }
    },
    updateProject() {
      var projectFormData = new FormData();

      var requiredData = {
        formData:this.selectOneProjectData,
      };
      projectFormData.append("data", JSON.stringify(requiredData));

      API.projectAPI
        .updateProject(projectFormData)
        .then(response => {
          if (response.data.responseCode == "OK") {
            alert("정상 갱신되었습니다");
            this.moveToUserProjectDetail();
          } else {
            alert(response.data.message);
            this.moveToUserProjectDetail();
          }
        })
        .catch(error => {
          console.log(error);
        });
    },
    moveToUserProjectDetail() {
      this.$router.push({
        name: "userProjectDetail"
      });
    },
  }
};
</script>

<style scoped>
.div {
  padding-top: 50px;
}

</style>
