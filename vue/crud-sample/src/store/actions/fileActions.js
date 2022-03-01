/*
   AnyX Platform version 1.0

   Copyright ⓒ 2020 anylogic corp. All rights reserved.

   This is a proprietary software of anylogic corp, and you may not use this file except in
   compliance with license agreement with anylogic corp. Any redistribution or use of this
   software, with or without modification shall be strictly prohibited without prior written
   approval of anylogic corp, and the copyright notice above does not evidence any actual or
   intended publication of such software.
*/

import { API } from "../../api/index.js";
import { makeUrlForBlob, SaveToDisk } from "../../utils/file.js";

export default {
  async FILE_DOWNLOAD(context, file) {
    try {
      const response = await API.fileAPI.fileDownloadApi(file.fileInfo);
      var fileURL = makeUrlForBlob(response.data);
      SaveToDisk(fileURL, file.fileOriginName);
    } catch (error) {
      console.log(error);
    }
  },
  async EXCEL_DOWNLOAD(context, excelFormData) {
    try {
      const response = await API.excelDownloadApi(excelFormData);
      return response;
    } catch (error) {
      console.log(error);
    }
  }
};
