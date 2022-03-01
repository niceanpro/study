using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringFormat
{
    class WriteHtmlJS
    {

        public void GenUpdate()
        {

            string module = "systemConfig";

            System.IO.FileStream fs = new FileStream("test.txt", FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);


            sw.WriteLine("/*");
            sw.WriteLine("   ADP Platform version 1.0");
            sw.WriteLine("");
            sw.WriteLine("   $opyright ⓒ 2018 anylogic corp. All rights reserved.");
            sw.WriteLine("");
            sw.WriteLine("   This is a proprietary software of anylogic corp, and you may not use this file except in");
            sw.WriteLine("   compliance with license agreement with anylogic corp. Any redistribution or use of this");
            sw.WriteLine("   software, with or without modification shall be strictly prohibited without prior written");
            sw.WriteLine("   approval of anylogic corp, and the copyright notice above does not evidence any actual or");
            sw.WriteLine("   intended publication of such software.");
            sw.WriteLine("*/");
            sw.WriteLine(@"angular.module('app.{0}')", module);
            sw.WriteLine(@"    .controller('AccountEditController', AccountEditController);");
            sw.WriteLine("");
            sw.WriteLine("function AccountEditController($rootScope, $scope, $timeout, systemConfigDataService, $state, $stateParams, popupControl, store, messageBox, focus, checkUtil) {{\n");
            sw.WriteLine("");
            sw.WriteLine("    var vm = this;");
            sw.WriteLine("    $scope.newData = $stateParams.sendParam;");
            sw.WriteLine("");
            sw.WriteLine("    $scope.idDuplicateCheck = false;");
            sw.WriteLine("");
            sw.WriteLine("");
            sw.WriteLine("    var loadScript = function () {{");
            sw.WriteLine("        var script = document.createElement('script');");
            sw.WriteLine("        script.type = 'text/javascript';");
            sw.WriteLine("        script.src = 'publish/js/common.js';");
            sw.WriteLine("        document.body.appendChild(script);");
            sw.WriteLine("");
            sw.WriteLine("    }}");
            sw.WriteLine("");
            sw.WriteLine("    $scope.$on('$viewContentLoaded', function() {");
            sw.WriteLine("        loadScript();");
            sw.WriteLine("        $timeout(function(){");
            sw.WriteLine("            currentLnb(4,4); 	 // 메뉴 경로 확인하여 적용");
            sw.WriteLine("        }, 100);");
            sw.WriteLine("    });");
            sw.WriteLine("");
            sw.WriteLine("    vm.loginNm = sessionStorage.getItem('loginNm');");
            sw.WriteLine("    vm.loginAplyClass = sessionStorage.getItem('loginAplyClass');");
            sw.WriteLine("    vm.loginMemberId = sessionStorage.getItem('loginMemberId');");
            sw.WriteLine("    vm.loginId = sessionStorage.getItem('loginId');");
            sw.WriteLine("");
            sw.WriteLine("");
            sw.WriteLine("    // input check");
            sw.WriteLine("    $scope.$watch('newData.checkPassword', checkUtil.inputPW, true);");
            sw.WriteLine("    $scope.$watch('newData.hp_no', checkUtil.inputHpNo, true);");
            sw.WriteLine("");
            sw.WriteLine("    $scope.updateData = function() {");
            sw.WriteLine("        $scope.selectedData = [];");
            sw.WriteLine("        $scope.selectedData.push($scope.newData);");
            sw.WriteLine("");
            sw.WriteLine("        if(! checkUtil.checkSeianPwd(vm.loginId, $scope.newData.passwd)) return;");
            sw.WriteLine("        if(! checkRV.checkRV($scope.newData.email, true, 'checkEmail', '이메일 형식을 확인하세요.')) return;");
            sw.WriteLine("");
            sw.WriteLine("        var sendParam = {};");
            sw.WriteLine("        sendParam.list = $scope.selectedData;");
            sw.WriteLine("");
            sw.WriteLine("        systemConfigDataService.insertObjs(sendParam, '/admin/systemConfig/updateAccount')");
            sw.WriteLine("        .success(function(data){");
            sw.WriteLine("            $state.go('accountList');");
            sw.WriteLine("        }).error(function(data){");
            sw.WriteLine("            $state.go('accountList');");
            sw.WriteLine("        });");
            sw.WriteLine("            ");
            sw.WriteLine("    }");
            sw.WriteLine("");
            sw.WriteLine("    $scope.goList = function() {");
            sw.WriteLine("        $state.go('accountList');");
            sw.WriteLine("    }");
            sw.WriteLine("");
            sw.WriteLine("}}");

            sw.Close();
        }
    }
}
