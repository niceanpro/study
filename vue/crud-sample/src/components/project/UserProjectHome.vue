
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
            <h2 class="pageheader-title" style="background-color: beige; width: max-content;">프로젝트 l234l 홈</h2>

  <!-- <div>
    <vue-qrcode v-bind:value="qrValue" />
  </div> -->

            <button @click="reload">Destroy And Re-Create Component</button>

            <!-- <qrcode-stream @init="onInit" v-if="!destroyed">
              <div class="loading-indicator" v-if="loading">
                Loading...
              </div>
            </qrcode-stream> -->


            <p>
              Track function:
              <select v-model="selected">
                <option v-for="option in options" :key="option.text" :value="option">
                  {{ option.text }}
                </option>
              </select>
            </p>
    
            <div>
              <p class="error">{{ error }}</p>
              <p class="decode-result">Last result: <b>{{ result }}</b></p>
              <qrcode-stream 
                @decode="onDecode" @init="onInit" 
                :key="_uid" :track="selected.value" 
                style=" height: 300px; width:30%;" />
            </div>

          
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
          
          <div>

            <b-card style="width: 1000px;">
              <div>
                <h3 style="float: left;">프로젝트 목록</h3>
                <b-input-group style="margin: auto; width: max-content;float: right;">
                  <b-select
                          v-model="prjSelSelected" id="selectOption" required="" style="height: 40px">
                          <option value="name">프로젝트 이름</option>
                          <option value="id">프로젝트 아이디</option>
                                                
                  </b-select>
                  
                  <b-form-input v-model="prjSelInputData" v-on:keyup.enter="selectProject(1)" style="height: 40px"></b-form-input>

                  <b-button variant="outline-success" @click="selectProject(1)" style="height: 40px">
                    <b-icon icon="search"></b-icon>
                  </b-button>
                </b-input-group>
              </div>
              
              <div>
                <table
                  id="example"
                  class="table table-striped table-bordered second"
                  style="width: 100%"
                >
                  <thead>
                    <tr>
                      <th style="color: black;">
                        No.
                      </th>
                      <th style="color: black;">
                        프로젝트 이름
                      </th>

                      <th style="color: black;">
                        날짜
                      </th>
                      <th style="color: black;">
                        생성 갯수
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr
                      class="tr"
                      id="mouse_hover"
                      v-for="item in selectProjectList"
                      :key="item.id"
                    >
                      <td>
                        {{ item.id }}
                      </td>
                      <td>
                        <div @click="moveToUserProjectDetail(item)">
                          {{ item.name }}
                        </div>

                      </td>
                      <td>{{ item.date }}</td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>

              
              <b-pagination
                v-model="selectProjectCond.pageNum"
                :total-rows="selectProjectRows"
                :per-page="selectProjectCond.pageCon"
                aria-controls="example"
                @input="selectProject(selectProjectCond.pageNum)"
                style="display: flex; justify-content: center;"
              ></b-pagination>
            </b-card>
          </div>
        </div>
        
        <div style="width: max-content; margin: auto;">
          <b-button variant="outline-success" @click="moveToUserProjectAdd()">
            등록
          </b-button>
        </div>
      
      </div>
    </div>
  </div>
</template>

<script>
import { formatDate } from "../../utils/date.js";
import { API } from "../../api/index.js";
// import {QrcodeStream, QrcodeDeopZone, QrcodeCapture } from 'vue-qrcode-reader'
import {QrcodeStream } from 'vue-qrcode-reader'
// import VueQrcode from 'vue-qrcode'


export default {
  components: {
    QrcodeStream,
    // QrcodeDropZone,
    // QrcodeCapture
  },
  data() {
    const options = [
      { text: "nothing (default)", value: undefined },
      { text: "outline", value: this.paintOutline },
      { text: "centered text", value: this.paintCenterText },
      { text: "bounding box", value: this.paintBoundingBox },
    ]

    const selected = options[1]

    return {
      selected,
      options,

qrValue : "My secret value",

      loading: false,
      destroyed: false,
      result: '',
      error: '',
      prjSelSelected: "",
      prjSelInputData: "",
      selectProjectList: [],
      selectProjectCond: {
        id: "",
        name: "",
        pageNum: 1,
        pageCon: 10,
        sortDirection: "DESC",
        sortItem: "id"
      },
      monthsSelectProject: [1, 3, 6],
      selectProjectPageCon: [10, 25, 50, 100]
    };
  },
  computed: {
    selectProjectRows() {
      if (
        this.selectProjectList != [] &&
        this.selectProjectList[0] != undefined
      ) {
        return this.selectProjectList[0].totalCnt; // DB로부터 얻어온 데이터의 총 개수
      } else {
        return 0;
      }
    },
  },
  watch: {},
  async created() {
    if (Object.keys(this.$route.query).length == 0) {
      this.$router
        .replace({
          query: this.projectCond
        })
        .catch(error => {
          console.log(error);
        });
    }
    // to do 
    // this.searchProjectByQuery(id, name, user_id);
    window.onpopstate = () => {
      // to do
      // this.searchProjectByQuery();
    };
  },
  mounted() {
    this.selectProject(1);
  },
  beforeDestroy() {

    window.onpopstate = null;
  },
  methods: {

    paintOutline (detectedCodes, ctx) {
      for (const detectedCode of detectedCodes) {
        const [ firstPoint, ...otherPoints ] = detectedCode.cornerPoints

        ctx.strokeStyle = "red";

        ctx.beginPath();
        ctx.moveTo(firstPoint.x, firstPoint.y);
        for (const { x, y } of otherPoints) {
          ctx.lineTo(x, y);
        }
        ctx.lineTo(firstPoint.x, firstPoint.y);
        ctx.closePath();
        ctx.stroke();
      }
    },

    paintBoundingBox (detectedCodes, ctx) {
      for (const detectedCode of detectedCodes) {
        const { boundingBox: { x, y, width, height } } = detectedCode

        ctx.lineWidth = 2
        ctx.strokeStyle = '#007bff'
        ctx.strokeRect(x, y, width, height)
      }
    },

    paintCenterText (detectedCodes, ctx) {
      for (const detectedCode of detectedCodes) {
        const { boundingBox, rawValue } = detectedCode

        const centerX = boundingBox.x + boundingBox.width/ 2
        const centerY = boundingBox.y + boundingBox.height/ 2

        const fontSize = Math.max(12, 50 * boundingBox.width/ctx.canvas.width)
        console.log(boundingBox.width, ctx.canvas.width)

        ctx.font = `bold ${fontSize}px sans-serif`
        ctx.textAlign = "center"

        ctx.lineWidth = 3
        ctx.strokeStyle = '#35495e'
        ctx.strokeText(detectedCode.rawValue, centerX, centerY)

        ctx.fillStyle = '#5cb984'
        ctx.fillText(rawValue, centerX, centerY)
      }
    },

    //     async onInit (promise) {
    //   this.loading = true

    //   try {
    //     await promise
    //   } catch (error) {
    //     console.error(error)
    //   } finally {
    //     this.loading = false
    //   }
    // },

    async reload () {
      this.destroyed = true

      await this.$nextTick()

      this.destroyed = false
    },

// ssl 인증서 생성
// $ mkcert example.com "*.example.com" example.test localhost 192.168.0.7 127.0.0.1 ::1

    async onInit (promise) {
      try {
        await promise
      } catch (error) {
        if (error.name === 'NotAllowedError') {
          this.error = "ERROR: you need to grant camera access permission"
        } else if (error.name === 'NotFoundError') {
          this.error = "ERROR: no camera on this device"
        } else if (error.name === 'NotSupportedError') {
          this.error = "ERROR: secure context required (HTTPS, localhost)"
        } else if (error.name === 'NotReadableError') {
          this.error = "ERROR: is the camera already in use?"
        } else if (error.name === 'OverconstrainedError') {
          this.error = "ERROR: installed cameras are not suitable"
        } else if (error.name === 'StreamApiNotSupportedError') {
          this.error = "ERROR: Stream API is not supported in this browser"
        } else if (error.name === 'InsecureContextError') {
          this.error = 'ERROR: Camera access is only permitted in secure context. Use HTTPS or localhost rather than HTTP.';
        } else {
          this.error = `ERROR: Camera error (${error.name})`;
        }
      }
    },

    onDecode (decodedString) {
      console.log("QRcode onDecode " + decodedString);
      this.result = decodedString;
      // ...
    },
    changeMonthProject(month) {
      var today = new Date();
      this.projectCond.end_dt = formatDate(today);
      var aMonthBefore = today.setMonth(today.getMonth() - month);
      this.projectCond.start_dt = formatDate(aMonthBefore);
    },
    changeSortSelectProject(header) {
      if (this.selectProjectCond.selectProjectSortItem == header) {
        this.selectProjectCond.selectProjectSortDirection == "ASC" ? "DESC" : "ASC";
      } else {
        this.selectProjectCond.selectProjectSortItem = header;
        this.selectProjectCond.selectProjectSortDirection = "ASC";
      }
      this.selectProject(this.selectProjectCond.pageNum);
    },
    selectProjectByPageNum(pageNum) {
      this.selectProjectCond.pageNum = pageNum;
      this.$router
        .push({
          query: this.selectProjectCond
        })
        .catch(error => {
          console.log(error);
        });
      this.selectProject(pageNum);
    },
    // eslint-disable-next-line
    async selectProject(pageNum) {
      // debugger; // eslint-disable-line no-debugger
      this.selectProjectCond.pageNum = pageNum;

      this.selectProjectCond.id = null;
      this.selectProjectCond.name = null;
      this.selectProjectCond[this.prjSelSelected] = this.prjSelInputData;

      try {
        const response = await API.projectAPI.selectProject(this.selectProjectCond);
        this.selectProjectList = response.data.data.rows;
        console.log("SelectProject", response);
      } catch (error) {
        console.log(error);
      }
      // this.$emit("event-name", this.SelectProject[0].TOTAL_CNT);
    },
    async selectProjectByQuery() {
      this.selectProjectCond = Object.assign({}, this.$route.query);
      try {
        const response = await API.projectAPI.selectProject(this.selectProjectCond);
        this.selectProjectList = response.data.data.rows;
        console.log(response);
      } catch (error) {
        console.log(error);
      }
      // this.$emit("event-name", this.SelectProject[0].TOTAL_CNT);
    },
    moveToUserProjectDetail(item) {
      this.$router.push({
        name: "userProjectDetail",
        params: {
          sendParam: item
        }
      });
    },
    moveToUserProjectAdd() {
      this.$router.push({
        name: "userProjectAdd"
      });
    },
  }
};
</script>

<style scoped>

qrcode-stream {
  height: 300px;
  width: 300px;
}

button {
  margin-bottom: 20px;
}

.loading-indicator {
  font-weight: bold;
  font-size: 2rem;
  text-align: center;
}

.div {
  padding-top: 50px;
}
</style>


