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
  <div class="containerForDetail" style="display: flex; width: max-content; margin: auto;">
    <form name="f" method="post">
      <div>
        <h2 class="pageheader-title" style="background-color: beige; width: max-content;">
          프로젝트 상세 정보
        </h2>
      </div>
      <hr class="dotted" />

      <div class="card">
      <div class="card-body">
        <div style="float: left; margin-right: 50px">
          <div>
            <div>
              <label style="margin-right: 5px;"><p class="pr-name">프로젝트 이름</p></label>
              <input type="text" v-model="selectOneProjectData.name" readonly />
            </div>
            <hr>
            <div>
              <label style="margin-right: 5px;"><p class="pr-des">프로젝트 설명</p></label><br>
              <textarea cols="38" rows="5" v-model="selectOneProjectData.project_desc" readonly></textarea>
            </div>
          </div>
        </div>
      </div>
      </div>

      <div style="width: max-content; margin:auto;">
            <b-button
              type="button"
              variant="outline-success"
              style="margin-right: 10px;"
              @click="moveToUserProjectUpdate(selectOneProjectData)"
            >
              수정
            </b-button>
            <b-button
              type="button"
              variant="outline-danger"
              style=""
              data-toggle="modal"
              data-target="#deleteModal"
              @click="deleteProject()"
            >
              삭제
            </b-button>
          </div>
    </form>
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
    this.params = this.$route.params;
  },
  mounted() {
    this.id = this.$route.params.sendParam.id // 홈 에서 받아온 id 데이터
    this.selectOneProject();
  },
  methods: {
    // eslint-disable-next-line
    async selectOneProject() {
      this.selectOneProjectCond.id = this.id;

      try {
        const response = await API.projectAPI.selectOneProject(this.selectOneProjectCond);
        this.selectOneProjectData = response.data.data;

        console.log("SelectOneProjectDetail",response);
      } catch (error) {
        console.log(error);
      }
    },
    async deleteProject() {
      const confirmDelete = confirm("삭제하시겠습니까?");
      if (confirmDelete == false) {
        return;
      }

      var postData = {
        id: this.selectOneProjectCond.id,
      };
      
      await API.projectAPI
        .deleteProject(postData)
        .then(response => {
          if (response.data.responseCode == "OK") {
            alert("정상 삭제되었습니다");
            this.moveToUserProjectHome();
          }else {
            alert("Error");
            this.moveToUserProjectHome();
          }
        })
        .catch(error => {
          console.log(error);
        });
    },
    moveToUserProjectHome() { // 홈 화면으로 이동
      this.$router.push({
        name: "userProjectHome"
      });
    },
    moveToUserProjectUpdate(item) { // 수정 화면으로 이동, item은 프로젝트의 데이터
      this.$router.push({
        name: "userProjectUpdate",
        params: {
          sendParam: item
        }
      });
    }
  }
};
</script>

<style scoped>
.containerForDetail {
  padding-top: 10%;
  width: 100%;
}

.detail-table {
  width: 100%;
  float: left;
}

.buttons {
  float: left;
  padding-left: 20%;
}

.myPreview {
  float: right;
}
</style>
