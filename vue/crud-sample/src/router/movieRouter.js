/*
   AnyX Platform version 1.0

   Copyright ⓒ 2020 anylogic corp. All rights reserved.

   This is a proprietary software of anylogic corp, and you may not use this file except in
   compliance with license agreement with anylogic corp. Any redistribution or use of this
   software, with or without modification shall be strictly prohibited without prior written
   approval of anylogic corp, and the copyright notice above does not evidence any actual or
   intended publication of such software.
*/

import MovieHomeView from "../views/movie/MovieHomeView.vue";
import MovieAddView from "../views/movie/MovieAddView.vue";
import MovieDetailView from "../views/movie/MovieDetailView.vue";
import MovieUpdateView from "../views/movie/MovieUpdateView.vue";

const movieRoutes = [
  {
    path: "/movie/movieHome",
    name: "movieHome",
    component: MovieHomeView
  },
  {
    path: "/movie/movieAdd",
    name: "movieAdd",
    component: MovieAddView
  },
  {
    path: "/movie/movieDetail",
    name: "movieDetail",
    component: MovieDetailView
  },
  {
    path: "/movie/movieUpdate",
    name: "movieUpdate",
    component: MovieUpdateView
  }
];

export { movieRoutes };
