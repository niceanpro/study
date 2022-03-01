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
  baseUrl: "http://localhost:8580/jihwan/movie/"
};

const movieAPIDFN = {
  movieAPI: (APIName, conditions) => {
    return movieAPI[APIName](conditions);
  }
};

const movieAPI = {
  selectMovie: conditions => {
    return axios.get(
      `${config.baseUrl}selectMovie/${makeQueryString(conditions)}`
    );
  },
  excelDownMovie: conditions => {
    return axios.post(
      `${config.baseUrl}excelDownMovie/${makeQueryString(conditions)}`
    );
  },
  insertMovie: movieFormData => {
    return axios.post(`${config.baseUrl}insertMovie/`, movieFormData, {
      headers: {
        "Content-Type": "multipart/form-data"
      }
    });
  },
  selectOneMovie: conditions => {
    return axios.get(
      `${config.baseUrl}selectOneMovie/${makeQueryString(conditions)}`
    );
  },
  deleteMovie: moviePostData => {
    return axios.post(`${config.baseUrl}deleteMovie/`, moviePostData);
  },
  updateMovie: movieFormData => {
    return axios.post(`${config.baseUrl}updateMovie/`, movieFormData, {
      headers: {
        "Content-Type": "multipart/form-data"
      }
    });
  }
};

export { movieAPIDFN, movieAPI };
