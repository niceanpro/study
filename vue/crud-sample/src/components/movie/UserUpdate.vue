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
import { createFile } from "../../utils/file.js";
import { checkRV } from "../../utils/checkRV.js";
import { API } from "../../api/index.js";

export default {
  data() {
    return {
      selectOneMovieData: {},
      selectOneMovieCond: {}
    };
  },
  computed: {},
  watch: {},
  async created() {},
  mounted() {
    this.selectOneMovie();
  },
  methods: {
    fileSelect() {
      console.log();
    },
    // eslint-disable-next-line
    async selectOneMovie() {


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
    async updateMovie() {
      if (this.checkValidationUpdateMovie() == false) {
        return;
      }

      var movieFormData = new FormData();

      // 추가된 것
      var finalList = [...this.selectOneMovieData.fileinfo];
      this.selectOneMovieData.fileinfo = [];
      this.selectOneMovieData.newAddFile = [];
      var fIdx = 0;

      finalList.forEach((f) => {
        if(!this.selectOneMovieOriginFiles.includes(f)){
          this.selectOneMovieData.newAddFile.push({
            comments: f.comments,
            addIndex: fIdx
          });
          movieFormData.append(`file${fIdx}`, f.rawFile);
        }
      }, this );

      // 삭제된 것
      this.selectOneMovieOriginFiles.forEach((f) => {
        if(!finalList.includes(f)){
          this.selectOneProjectData.listDelFile.push(f);
        }
      }, this);

      var requiredData = {
        formData: this.selectOneMovieData
      };
      movieFormData.append("data", JSON.stringify(requiredData));

      API.movieAPI
        .updateMovie(movieFormData)
        .then(response => {
          if (response.status == 200) {
            alert("정상 갱신되었습니다");
            this.moveToMovieHome();
          }
        })
        .catch(error => {
          console.log(error);
        });
    },

    async addFile(comment){
      try {
        var newFile = {
          rawFile: this.$refs.file.files[0],
          file: "",
          comments: comment, 
        };
      } catch {
        return;
      }

      newFile = await createFile(newFile.rawFile, newFile);
      this.selectOneMovieData.fileinfo.push(newFile);
    },
    delFile(item) {
      // 화면에서 삭제
      var findFile = this.selectOneMovieData.fileinfo.findIndex((f) => f.name == item.name);
      this.selectOneMovieData.fileinfo.splice(findFile, findFile===-1? 0 : 1);
    },
    previewImage(item) {
      if("file_origin_name" in item){
          let preview = document.getElementById("img");
          preview.setAttribute("src", item.file_url);
      }
      else
      {
        let reader = new FileReader();
        reader.readAsDataURL(item.rawFile);
        reader.onload = e => {
          let preview = document.getElementById("img");
          preview.setAttribute("src", e.target.result);
        }
      }
    },

    // Move Function
    moveToMovieHome() {
      this.$router.push({
        name: "movieHome"
      });
    },

    // Check Validation
    checkValidationUpdateMovie() {
      if (
        !checkRV.checkRV(
          this.selectOneMovieData.movie_name,
          false,
          "checkStrLen",
          "movie_name 형식을 확인하세요.",
          10
        )
      )
        return false;
      if (
        !checkRV.checkRV(
          this.selectOneMovieData.movie_des,
          false,
          "checkStrLen",
          "movie_des 형식을 확인하세요.",
          50
        )
      )
        return false;
      if (
        !checkRV.checkRV(
          this.selectOneMovieData.click_count,
          false,
          "checkNumberOnly",
          "click_count 형식을 확인하세요."
        )
      )
        return false;
      if (
        !checkRV.checkRV(
          this.selectOneMovieData.movie_time,
          false,
          "checkAll",
          "movie_time 형식을 확인하세요."
        )
      )
        return false;

      return true;
    }
  }
};
</script>

<style lang="scss" scoped></style>
