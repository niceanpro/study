/*
   AnyX Platform version 1.0

   Copyright ⓒ 2020 anylogic corp. All rights reserved.

   This is a proprietary software of anylogic corp, and you may not use this file except in
   compliance with license agreement with anylogic corp. Any redistribution or use of this
   software, with or without modification shall be strictly prohibited without prior written
   approval of anylogic corp, and the copyright notice above does not evidence any actual or
   intended publication of such software.
*/

import axios from "axios";
import { makeQueryString } from "../utils/query.js";

const config = {
  baseUrl: "http://192.168.0.86:8580/jihwan/common/"
};

export default () => {
  return {
    fileDownloadApi: conditions => {
      return axios.get(
        `${config.baseUrl}fileDownload/${makeQueryString(conditions)}`,
        {
          responseType: "arraybuffer"
        }
      );
    }
  };
};
