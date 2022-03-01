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
    <h1>Movie Add</h1>
  </div>
</template>

<script>
import { createFile } from "../../utils/file.js";
import { checkRV } from "../../utils/checkRV.js";
import { API } from "../../api/index.js";

export default {
  data() {
    return {
      movieData: {
        id: "",
        movie_name: "",
        movie_des: "",
        click_count: "",
        movie_time: "",
        fileinfo: []
      }
    };
  },
  computed: {},
  watch: {},
  async created() {},
  mounted() {},
  methods: {
    fileSelect() {
      console.log();
    },
    async insertMovie() {
      // if (this.checkRVMovie() == false) {
      //   return;
      // }

      var movieFormData = new FormData();

      // 추가된 것
      var finalList = [...this.movieData.fileinfo];
      this.movieData.fileinfo = [];
      this.movieData.newAddFile = [];
      var fIdx = 0;

      finalList.forEach((f) => {
        this.movieData.newAddFile.push({
          comments: f.comments,
          addIndex: fIdx
        });
        movieFormData.append(`file${fIdx}`, f.rawFile);
      }, this );


      var requiredData = {
        formData: this.movieData
      };
      movieFormData.append("data", JSON.stringify(requiredData));

      API.movieAPI
        .insertMovie(movieFormData)
        .then(response => {
          if (response.status == 200) {
            alert("정상 등록되었습니다");
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
      this.movieData.fileinfo.push(newFile);
    },
    delFile(item) {
      // 화면에서 삭제
      var findFile = this.movieData.fileinfo.findIndex((f) => f.name == item.name);
      this.movieData.fileinfo.splice(findFile, findFile===-1? 0 : 1);
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
    checkValidationInsertMovie() {
      if (
        !checkRV.checkRV(
          this.movie.movie_name,
          false,
          "checkStrLen",
          "movie_name 형식을 확인하세요.",
          10
        )
      )
        return false;
      if (
        !checkRV.checkRV(
          this.movie.movie_des,
          false,
          "checkStrLen",
          "movie_des 형식을 확인하세요.",
          50
        )
      )
        return false;
      if (
        !checkRV.checkRV(
          this.movie.click_count,
          false,
          "checkNumberOnly",
          "click_count 형식을 확인하세요."
        )
      )
        return false;
      if (
        !checkRV.checkRV(
          this.movie.movie_time,
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
