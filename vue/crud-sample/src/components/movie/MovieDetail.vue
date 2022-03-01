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
  </div>
</template>

<script>
import { API } from "../../api/index.js";

export default {
  data() {
    return {
      params: {},
      id: "",
      selectOneMovieData: {},
      selectOneMovieCond: {
        id: "",
      },
      selectUserData: {},
      selectUserCond: {
        id: "",
      }
    };
  },
  computed: {},
  watch: {},
  async created() {
    this.params = this.$route.params;    // to do    // params
  },
  mounted() {
    this.selectOneMovie();
  },
  methods: {
    // eslint-disable-next-line
    async selectOneMovie() {
      this.selectOneMovieCond.id = this.id;


      try {
        const response = await API.movieAPI.selectOneMovie(this.selectOneMovieCond);
        this.selectOneMovieData = response.data.data;
        this.selectOneMovieOriginFiles = [...this.selectOneProjectData.fileinfo];
        this.selectOneMovieData.listDelFile = [];

        console.log(response);
      } catch (error) {
        console.log(error);
      }
    },
    downloadFile(file) {
      var fileInfo = {
        uploadPath: file.file_path,
        orgFilename: file.file_name,
        mimeTypeParam: "application/octet-stream"
      };

      var fileParams = {
        fileInfo,
        fileOriginName: file.file_origin_name
      };

      this.$store.dispatch("FILE_DOWNLOAD", fileParams);
    },
    // eslint-disable-next-line
    async selectUser() {
      this.selectUserCond.id = this.id;


      try {
        const response = await API.userAPI.selectUser(this.selectUserCond);
        this.selectUserData = response.data.data;

        console.log(response);
      } catch (error) {
        console.log(error);
      }
    },
    async deleteMovie() {
      const confirmDelete = confirm("삭제하시겠습니까?");
      if (confirmDelete == false) {
        return;
      }

      var delMovieParams = [];

      delMovieParams.push({
        delObj: {
          id: this.selectOneMovieCond.id
        }
      });

      var postData = {
        params: delMovieParams
      };

      await API.movieAPI
        .deleteMovie(postData)
        .then(response => {
          if (response.status == 200) {
            alert("정상 삭제되었습니다");
            this.moveToMovieHome();
          }
        })
        .catch(error => {
          console.log(error);
        });
    },
    async deleteMovie2() {
      const confirmDelete = confirm("삭제하시겠습니까?");
      if (confirmDelete == false) {
        return;
      }

      var delUserParams = [];

      delUserParams.push({
        delObj: {
          user_id: this.selectUserCond.user_id
        }
      });

      var postData = {
        params: delUserParams
      };

      await API.userAPI
        .deleteMovie2(postData)
        .then(response => {
          if (response.status == 200) {
            alert("정상 삭제되었습니다");
            this.moveToMovieHome();
          }
        })
        .catch(error => {
          console.log(error);
        });
    },

    // Move Function
    moveToMovieHome() {
      this.$router.push({
        name: "movieHome"
      });
    },

    // Move Function
    moveToMovieUpdate(item) {
      this.$router.push({
        name: "movieUpdate",
        params: {
          sendParam: item
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped></style>
