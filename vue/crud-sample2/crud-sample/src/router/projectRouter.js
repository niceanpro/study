/*
   AnyX Platform version 1.0

   Copyright ⓒ 2020 anylogic corp. All rights reserved.

   This is a proprietary software of anylogic corp, and you may not use this file except in
   compliance with license agreement with anylogic corp. Any redistribution or use of this
   software, with or without modification shall be strictly prohibited without prior written
   approval of anylogic corp, and the copyright notice above does not evidence any actual or
   intended publication of such software.
*/
import UserProjectAddView from "../views/project/UserProjectAddView.vue";
import UserProjectDetailView from "../views/project/UserProjectDetailView.vue";
import UserProjectHomeView from "../views/project/UserProjectHomeView.vue";
import UserProjectUpdateView from "../views/project/UserProjectUpdateView.vue";


const projectRoutes = [

  {
    path: "/",
    redirect: "/project/userProjectHome",
  },
  {
    path: "/project/userProjectHome",
    name: "userProjectHome",
    component: UserProjectHomeView
  },
  {
    path: "/project/userProjectDetail/",
    name: "userProjectDetail",
    component: UserProjectDetailView
  },
  {
    path: "/project/userProjectAdd",
    name: "userProjectAdd",
    component: UserProjectAddView
  },
  {
    path: "/project/userProjectUpdate",
    name: "userProjectUpdate",
    component: UserProjectUpdateView
  },
];

export { projectRoutes };
