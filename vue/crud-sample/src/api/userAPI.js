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
  baseUrl: "http://localhost:8580/jihwan/user/"
};

const userAPIDFN = {
  userAPI: (APIName, conditions) => {
    return userAPI[APIName](conditions);
  }
};

const userAPI = {
  selectUser: conditions => {
    return axios.get(
      `${config.baseUrl}selectUser/${makeQueryString(conditions)}`
    );
  },
  deleteMovie2: userPostData => {
    return axios.post(`${config.baseUrl}deleteMovie2/`, userPostData);
  }
};

export { userAPIDFN, userAPI };
