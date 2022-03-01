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
  baseUrl: "http://localhost:8580/sample/project/",
  wagUrl: "http://192.168.0.70:5000/"
};

const projectAPIDFN = {
  projectAPI: (APIName, conditions) => {
    return projectAPI[APIName](conditions);
  }
};

 

const projectAPI = {
  selectOneImageSrc: conditions => {
    return axios.get(
      `${config.baseUrl}selectOneImageSrc/${makeQueryString(conditions)}`
    );
  },
  insertProject: projectFormData => {
    return axios.post(`${config.baseUrl}insertProject/`, projectFormData, {
      headers: {
        "Content-Type": "multipart/form-data"
      }
    });
  },
  selectOneProject: conditions => {
    return axios.get(
      `${config.baseUrl}selectOneProject/${makeQueryString(conditions)}`
    );
  },
  selectProject: conditions => {
    return axios.get(
      `${config.baseUrl}selectProject/${makeQueryString(conditions)}`
    );
  },
  updateProject: projectFormData => {
    return axios.post(`${config.baseUrl}updateProject/`, projectFormData, {
      headers: {
        "Content-Type": "multipart/form-data"
      }
    });
  },
  deleteProject: conditions => {
    return axios.get(
      `${config.baseUrl}deleteProject/${makeQueryString(conditions)}`
    );
  },

  requestHTML: conditions => {
    return axios.post(`${config.wagUrl}gen${makeQueryString(conditions)}`, conditions, {
      headers: {
      }
    });
  },

  // editor api
  insertBoard: boardFormData => {
    return axios.post(`${config.baseUrl}insertBoard/`, boardFormData, {
      headers: {
        "Content-Type": "multipart/form-data"
      }
    });
  },

  selectBoard: conditions => {
    return axios.get(
      `${config.baseUrl}selectBoard/${makeQueryString(conditions)}`
    );
  },

  selectOneBoard: conditions => {
    return axios.get(
      `${config.baseUrl}selectOneBoard/${makeQueryString(conditions)}`
    );
  },

};

export { projectAPIDFN, projectAPI };
