
  angular.module('testAngular', [])
    .controller('ExampleController', ['$scope', function($scope) {
       
    $scope.str = "aaa";
    // alert($scope.str);

    var str = '{"data_list":[{"pagetotal_qty":1006,"data_list":[{"part_jj":"","order_no":"91025-35-1","part_no":"1-30-000015","shipto_name":"재고용","amount":75900,"ordernum_cust":"","unit_saleprice":75900,"qty":1,"part_hb":"BT40-SDC7-60"},{"part_jj":"","order_no":"91025-36-1","part_no":"1-30-000016","shipto_name":"재고용","amount":77550,"ordernum_cust":"","unit_saleprice":77550,"qty":1,"part_hb":"BT40-SDC7-90(단종)"},{"part_jj":"","order_no":"91025-23-1","part_no":"1-30-000019","shipto_name":"재고용","amount":379500,"ordernum_cust":"","unit_saleprice":75900,"qty":5,"part_hb":"BT40-SDC10-60(단종)"},{"part_jj":"","order_no":"91025-25-1","part_no":"1-30-000020","shipto_name":"재고용","amount":1551000,"ordernum_cust":"","unit_saleprice":77550,"qty":20,"part_hb":"BT40-SDC10-90(단종)"},{"part_jj":"","order_no":"91025-24-1","part_no":"1-30-000023","shipto_name":"재고용","amount":163900,"ordernum_cust":"","unit_saleprice":81950,"qty":2,"part_hb":"BT40-SDC10-135(단종)"},{"part_jj":"","order_no":"91025-27-1","part_no":"1-30-000027","shipto_name":"재고용","amount":237600,"ordernum_cust":"","unit_saleprice":79200,"qty":3,"part_hb":"BT40-SDC13-90"},{"part_jj":"","order_no":"91025-26-1","part_no":"1-30-000028","shipto_name":"재고용","amount":404250,"ordernum_cust":"","unit_saleprice":80850,"qty":5,"part_hb":"BT40-SDC13-120(단종)"},{"part_jj":"","order_no":"91025-28-1","part_no":"1-30-000030","shipto_name":"재고용","amount":84700,"ordernum_cust":"","unit_saleprice":84700,"qty":1,"part_hb":"BT40-SDC13-150(단종)"},{"part_jj":"","order_no":"91025-29-1","part_no":"1-30-000032","shipto_name":"재고용","amount":92950,"ordernum_cust":"","unit_saleprice":92950,"qty":1,"part_hb":"BT40-SDC13-180"},{"part_jj":"","order_no":"91025-33-1","part_no":"1-30-000034","shipto_name":"재고용","amount":247500,"ordernum_cust":"","unit_saleprice":82500,"qty":3,"part_hb":"BT40-SDC20-60"},{"part_jj":"","order_no":"91025-34-1","part_no":"1-30-000035","shipto_name":"재고용","amount":168300,"ordernum_cust":"","unit_saleprice":84150,"qty":2,"part_hb":"BT40-SDC20-90(단종)"},{"part_jj":"","order_no":"91025-68-1","part_no":"1-30-000044","shipto_name":"재고용","amount":473000,"ordernum_cust":"","unit_saleprice":94600,"qty":5,"part_hb":"BT50-SDC10-90(단종)"},{"part_jj":"","order_no":"91025-69-1","part_no":"1-30-000046","shipto_name":"재고용","amount":331650,"ordernum_cust":"","unit_saleprice":110550,"qty":3,"part_hb":"BT50-SDC10-165(단종)"},{"part_jj":"","order_no":"91025-70-1","part_no":"1-30-000048","shipto_name":"재고용","amount":489500,"ordernum_cust":"","unit_saleprice":97900,"qty":5,"part_hb":"BT50-SDC13-105(단종)"},{"part_jj":"","order_no":"91025-71-1","part_no":"1-30-000049","shipto_name":"재고용","amount":489500,"ordernum_cust":"","unit_saleprice":97900,"qty":5,"part_hb":"BT50-SDC13-135(단종)"},{"part_jj":"","order_no":"91025-72-1","part_no":"1-30-000051","shipto_name":"재고용","amount":312400,"ordernum_cust":"","unit_saleprice":156200,"qty":2,"part_hb":"BT50-SDC13-180"},{"part_jj":"","order_no":"91025-76-1","part_no":"1-30-000054","shipto_name":"재고용","amount":530750,"ordernum_cust":"","unit_saleprice":106150,"qty":5,"part_hb":"BT50-SDC20-105(단종)"},{"part_jj":"","order_no":"91025-77-1","part_no":"1-30-000055","shipto_name":"재고용","amount":530750,"ordernum_cust":"","unit_saleprice":106150,"qty":5,"part_hb":"BT50-SDC20-135(단종)"},{"part_jj":"","order_no":"91025-78-1","part_no":"1-30-000057","shipto_name":"재고용","amount":1215500,"ordernum_cust":"","unit_saleprice":121550,"qty":10,"part_hb":"BT50-SDC20-165(단종)"},{"part_jj":"","order_no":"91025-79-1","part_no":"1-30-000058","shipto_name":"재고용","amount":312400,"ordernum_cust":"","unit_saleprice":156200,"qty":2,"part_hb":"BT50-SDC20-180(단종)"},{"part_jj":"","order_no":"91025-80-1","part_no":"1-30-000061","shipto_name":"재고용","amount":222200,"ordernum_cust":"","unit_saleprice":111100,"qty":2,"part_hb":"BT50-SDC26-105"},{"part_jj":"","order_no":"91025-81-1","part_no":"1-30-000063","shipto_name":"재고용","amount":127050,"ordernum_cust":"","unit_saleprice":127050,"qty":1,"part_hb":"BT50-SDC26-165(단종)"},{"part_jj":"","order_no":"91025-21-1","part_no":"1-30-000090","shipto_name":"재고용","amount":165000,"ordernum_cust":"","unit_saleprice":55000,"qty":3,"part_hb":"S25-SDC10-150M"},{"part_jj":"","order_no":"91025-22-1","part_no":"1-30-000095","shipto_name":"재고용","amount":165000,"ordernum_cust":"","unit_saleprice":55000,"qty":3,"part_hb":"S25-SDC13-150M"},{"part_jj":"","order_no":"91025-32-1","part_no":"1-30-000231","shipto_name":"재고용","amount":1639000,"ordernum_cust":"","unit_saleprice":81950,"qty":20,"part_hb":"BT40-SDC16-90(단종)"},{"part_jj":"","order_no":"91025-30-1","part_no":"1-30-000317","shipto_name":"재고용","amount":81950,"ordernum_cust":"","unit_saleprice":81950,"qty":1,"part_hb":"BT40-SDC16-120(단종)"},{"part_jj":"","order_no":"91025-19-1","part_no":"1-30-000329","shipto_name":"재고용","amount":283250,"ordernum_cust":"","unit_saleprice":56650,"qty":5,"part_hb":"S20-SDC10S-150M"},{"part_jj":"","order_no":"91025-75-1","part_no":"1-30-000392","shipto_name":"재고용","amount":2046000,"ordernum_cust":"","unit_saleprice":102300,"qty":20,"part_hb":"BT50-SDC16-105(단종)"},{"part_jj":"","order_no":"91025-17-1","part_no":"1-30-000477","shipto_name":"재고용","amount":107800,"ordernum_cust":"","unit_saleprice":53900,"qty":2,"part_hb":"S16-SDC7S-150M"},{"part_jj":"","order_no":"91025-18-1","part_no":"1-30-000478","shipto_name":"재고용","amount":283250,"ordernum_cust":"","unit_saleprice":56650,"qty":5,"part_hb":"S16-SDC10S-150M"},{"part_jj":"","order_no":"91025-74-1","part_no":"1-30-000531","shipto_name":"재고용","amount":950400,"ordernum_cust":"","unit_saleprice":118800,"qty":8,"part_hb":"BT50-SDC16-165(단종)"},{"part_jj":"","order_no":"91025-20-1","part_no":"1-30-000673","shipto_name":"재고용","amount":178200,"ordernum_cust":"","unit_saleprice":59400,"qty":3,"part_hb":"S20-SDC13S-150M"},{"part_jj":"","order_no":"91025-16-1","part_no":"1-30-000721","shipto_name":"재고용","amount":242000,"ordernum_cust":"","unit_saleprice":121000,"qty":2,"part_hb":"BT40-NPU13-130"},{"part_jj":"","order_no":"91025-66-1","part_no":"1-30-000727","shipto_name":"재고용","amount":1463000,"ordernum_cust":"","unit_saleprice":146300,"qty":10,"part_hb":"BT50-NPU13-130"},{"part_jj":"","order_no":"91025-67-1","part_no":"1-30-000728","shipto_name":"재고용","amount":300300,"ordernum_cust":"","unit_saleprice":150150,"qty":2,"part_hb":"BT50-NPU13-190"},{"part_jj":"","order_no":"91025-15-1","part_no":"1-30-000773","shipto_name":"재고용","amount":1133000,"ordernum_cust":"","unit_saleprice":113300,"qty":10,"part_hb":"BT40-NPU13-105"},{"part_jj":"","order_no":"91025-65-1","part_no":"1-30-000775","shipto_name":"재고용","amount":717750,"ordernum_cust":"","unit_saleprice":143550,"qty":5,"part_hb":"BT50-NPU13-115"},{"part_jj":"","order_no":"91025-42-1","part_no":"1-30-001305","shipto_name":"재고용","amount":49500,"ordernum_cust":"","unit_saleprice":49500,"qty":1,"part_hb":"BT40-SLA16-90"},{"part_jj":"","order_no":"91025-43-1","part_no":"1-30-001306","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":49500,"qty":2,"part_hb":"BT40-SLA20-90"},{"part_jj":"","order_no":"91025-44-1","part_no":"1-30-001308","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":49500,"qty":2,"part_hb":"BT40-SLA25-90"},{"part_jj":"","order_no":"91025-45-1","part_no":"1-30-001310","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":49500,"qty":2,"part_hb":"BT40-SLA32-90"},{"part_jj":"","order_no":"91025-5-1","part_no":"1-30-001842","shipto_name":"재고용","amount":247500,"ordernum_cust":"","unit_saleprice":49500,"qty":5,"part_hb":"BT40-FMA25.4-45"},{"part_jj":"","order_no":"91025-6-1","part_no":"1-30-001843","shipto_name":"재고용","amount":103400,"ordernum_cust":"","unit_saleprice":51700,"qty":2,"part_hb":"BT40-FMA25.4-90"},{"part_jj":"","order_no":"91025-7-1","part_no":"1-30-001845","shipto_name":"재고용","amount":96800,"ordernum_cust":"","unit_saleprice":48400,"qty":2,"part_hb":"BT40-FMA31.75-45"},{"part_jj":"","order_no":"91025-8-1","part_no":"1-30-001846","shipto_name":"재고용","amount":103400,"ordernum_cust":"","unit_saleprice":51700,"qty":2,"part_hb":"BT40-FMA31.75-75"},{"part_jj":"","order_no":"91025-49-1","part_no":"1-30-001852","shipto_name":"재고용","amount":151800,"ordernum_cust":"","unit_saleprice":75900,"qty":2,"part_hb":"BT50-FMA25.4-90"},{"part_jj":"","order_no":"91025-50-1","part_no":"1-30-001855","shipto_name":"재고용","amount":147400,"ordernum_cust":"","unit_saleprice":73700,"qty":2,"part_hb":"BT50-FMA31.75-45"},{"part_jj":"","order_no":"91025-51-1","part_no":"1-30-001856","shipto_name":"재고용","amount":151800,"ordernum_cust":"","unit_saleprice":75900,"qty":2,"part_hb":"BT50-FMA31.75-75"},{"part_jj":"","order_no":"91025-52-1","part_no":"1-30-001857","shipto_name":"재고용","amount":159500,"ordernum_cust":"","unit_saleprice":79750,"qty":2,"part_hb":"BT50-FMA31.75-105"},{"part_jj":"","order_no":"91025-53-1","part_no":"1-30-001863","shipto_name":"재고용","amount":157300,"ordernum_cust":"","unit_saleprice":78650,"qty":2,"part_hb":"BT50-FMA38.1-75"},{"part_jj":"","order_no":"91025-56-1","part_no":"1-30-001866","shipto_name":"재고용","amount":212300,"ordernum_cust":"","unit_saleprice":106150,"qty":2,"part_hb":"BT50-FMA47.625-75"},{"part_jj":"","order_no":"91025-54-1","part_no":"1-30-001867","shipto_name":"재고용","amount":159500,"ordernum_cust":"","unit_saleprice":79750,"qty":2,"part_hb":"BT50-FMA50.8-45"},{"part_jj":"","order_no":"91025-55-1","part_no":"1-30-001868","shipto_name":"재고용","amount":167200,"ordernum_cust":"","unit_saleprice":83600,"qty":2,"part_hb":"BT50-FMA50.8-75"},{"part_jj":"","order_no":"91025-59-1","part_no":"1-30-010771","shipto_name":"재고용","amount":4356000,"ordernum_cust":"","unit_saleprice":145200,"qty":30,"part_hb":"BT50-NPM32-110"},{"part_jj":"","order_no":"91025-61-1","part_no":"1-30-010773","shipto_name":"재고용","amount":1452000,"ordernum_cust":"","unit_saleprice":145200,"qty":10,"part_hb":"BT50-NPM32-165"},{"part_jj":"","order_no":"91025-13-1","part_no":"1-30-011606","shipto_name":"재고용","amount":349800,"ordernum_cust":"","unit_saleprice":116600,"qty":3,"part_hb":"BT40-NPM32-120"},{"part_jj":"","order_no":"91025-14-1","part_no":"1-30-011607","shipto_name":"재고용","amount":359700,"ordernum_cust":"","unit_saleprice":119900,"qty":3,"part_hb":"BT40-NPM32-135"},{"part_jj":"","order_no":"91025-62-1","part_no":"1-30-011643","shipto_name":"재고용","amount":1727000,"ordernum_cust":"","unit_saleprice":172700,"qty":10,"part_hb":"BT50-NPM42-110"},{"part_jj":"","order_no":"91025-63-1","part_no":"1-30-011644","shipto_name":"재고용","amount":882750,"ordernum_cust":"","unit_saleprice":176550,"qty":5,"part_hb":"BT50-NPM42-135"},{"part_jj":"","order_no":"91025-64-1","part_no":"1-30-011645","shipto_name":"재고용","amount":359700,"ordernum_cust":"","unit_saleprice":179850,"qty":2,"part_hb":"BT50-NPM42-165"},{"part_jj":"","order_no":"91025-11-1","part_no":"1-30-011732","shipto_name":"재고용","amount":310200,"ordernum_cust":"","unit_saleprice":103400,"qty":3,"part_hb":"BT40-NPM20-85"},{"part_jj":"","order_no":"91025-10-1","part_no":"1-30-011744","shipto_name":"재고용","amount":213400,"ordernum_cust":"","unit_saleprice":106700,"qty":2,"part_hb":"BT40-NPM20-100"},{"part_jj":"","order_no":"91025-9-1","part_no":"1-30-011753","shipto_name":"재고용","amount":517000,"ordernum_cust":"","unit_saleprice":103400,"qty":5,"part_hb":"NT40-NPM32-95"},{"part_jj":"","order_no":"91025-57-1","part_no":"1-30-011755","shipto_name":"재고용","amount":374550,"ordernum_cust":"","unit_saleprice":124850,"qty":3,"part_hb":"NT50-NPM32-95"},{"part_jj":"","order_no":"91025-58-1","part_no":"1-30-011756","shipto_name":"재고용","amount":745250,"ordernum_cust":"","unit_saleprice":149050,"qty":5,"part_hb":"NT50-NPM42-95"},{"part_jj":"","order_no":"91025-12-1","part_no":"1-30-011853","shipto_name":"재고용","amount":2266000,"ordernum_cust":"","unit_saleprice":113300,"qty":20,"part_hb":"BT40-NPM32-110"},{"part_jj":"","order_no":"91025-40-1","part_no":"1-30-013459","shipto_name":"재고용","amount":245850,"ordernum_cust":"","unit_saleprice":81950,"qty":3,"part_hb":"BT40-DSK16-90"},{"part_jj":"","order_no":"91025-84-1","part_no":"1-30-013471","shipto_name":"재고용","amount":282150,"ordernum_cust":"","unit_saleprice":94050,"qty":3,"part_hb":"BT50-DSK10-105"},{"part_jj":"","order_no":"91025-85-1","part_no":"1-30-013472","shipto_name":"재고용","amount":313500,"ordernum_cust":"","unit_saleprice":104500,"qty":3,"part_hb":"BT50-DSK10-135"},{"part_jj":"","order_no":"91025-47-1","part_no":"1-30-013697","shipto_name":"재고용","amount":414700,"ordernum_cust":"","unit_saleprice":207350,"qty":2,"part_hb":"BT50-DTN22-140"},{"part_jj":"","order_no":"91025-2-1","part_no":"1-30-013768","shipto_name":"재고용","amount":270600,"ordernum_cust":"","unit_saleprice":135300,"qty":2,"part_hb":"BT40-DTN12-90"},{"part_jj":"","order_no":"91025-1-1","part_no":"1-30-013769","shipto_name":"재고용","amount":270600,"ordernum_cust":"","unit_saleprice":135300,"qty":2,"part_hb":"BT40-DTN12-120"},{"part_jj":"","order_no":"91025-3-1","part_no":"1-30-013770","shipto_name":"재고용","amount":343200,"ordernum_cust":"","unit_saleprice":171600,"qty":2,"part_hb":"BT40-DTN22-130"},{"part_jj":"","order_no":"91025-4-1","part_no":"1-30-013771","shipto_name":"재고용","amount":343200,"ordernum_cust":"","unit_saleprice":171600,"qty":2,"part_hb":"BT40-DTN22-160"},{"part_jj":"","order_no":"91025-46-1","part_no":"1-30-013773","shipto_name":"재고용","amount":349800,"ordernum_cust":"","unit_saleprice":174900,"qty":2,"part_hb":"BT50-DTN12-130"},{"part_jj":"","order_no":"91025-48-1","part_no":"1-30-013774","shipto_name":"재고용","amount":427900,"ordernum_cust":"","unit_saleprice":213950,"qty":2,"part_hb":"BT50-DTN22-170"},{"part_jj":"","order_no":"91174-8-1","part_no":"1-30-001322","shipto_name":"재고용","amount":130900,"ordernum_cust":"","unit_saleprice":65450,"qty":2,"part_hb":"BT50-SLA16-90"},{"part_jj":"","order_no":"91174-9-1","part_no":"1-30-001328","shipto_name":"재고용","amount":332750,"ordernum_cust":"","unit_saleprice":66550,"qty":5,"part_hb":"BT50-SLA20-105"},{"part_jj":"","order_no":"91174-10-1","part_no":"1-30-001332","shipto_name":"재고용","amount":332750,"ordernum_cust":"","unit_saleprice":66550,"qty":5,"part_hb":"BT50-SLA25-105"},{"part_jj":"","order_no":"91174-11-1","part_no":"1-30-001335","shipto_name":"재고용","amount":332750,"ordernum_cust":"","unit_saleprice":66550,"qty":5,"part_hb":"BT50-SLA32-105"},{"part_jj":"","order_no":"91174-12-1","part_no":"1-30-001344","shipto_name":"재고용","amount":382250,"ordernum_cust":"","unit_saleprice":76450,"qty":5,"part_hb":"BT50-SLA40-105"},{"part_jj":"","order_no":"91174-18-1","part_no":"1-30-004072","shipto_name":"재고용","amount":28600,"ordernum_cust":"","unit_saleprice":14300,"qty":2,"part_hb":"ER11-2.0"},{"part_jj":"","order_no":"91174-19-1","part_no":"1-30-004074","shipto_name":"재고용","amount":28600,"ordernum_cust":"","unit_saleprice":14300,"qty":2,"part_hb":"ER11-3.0"},{"part_jj":"","order_no":"91174-20-1","part_no":"1-30-004076","shipto_name":"재고용","amount":42900,"ordernum_cust":"","unit_saleprice":14300,"qty":3,"part_hb":"ER11-4.0"},{"part_jj":"","order_no":"91174-21-1","part_no":"1-30-004078","shipto_name":"재고용","amount":42900,"ordernum_cust":"","unit_saleprice":14300,"qty":3,"part_hb":"ER11-5.0"},{"part_jj":"","order_no":"91174-22-1","part_no":"1-30-004080","shipto_name":"재고용","amount":42900,"ordernum_cust":"","unit_saleprice":14300,"qty":3,"part_hb":"ER11-6.0"},{"part_jj":"","order_no":"91174-24-1","part_no":"1-30-004084","shipto_name":"재고용","amount":60500,"ordernum_cust":"","unit_saleprice":12100,"qty":5,"part_hb":"ER16-2.0"},{"part_jj":"","order_no":"91174-25-1","part_no":"1-30-004085","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER16-3.0"},{"part_jj":"","order_no":"91174-26-1","part_no":"1-30-004086","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER16-4.0"},{"part_jj":"","order_no":"91174-27-1","part_no":"1-30-004087","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER16-5.0"},{"part_jj":"","order_no":"91174-28-1","part_no":"1-30-004088","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER16-6.0"},{"part_jj":"","order_no":"91174-29-1","part_no":"1-30-004089","shipto_name":"재고용","amount":36300,"ordernum_cust":"","unit_saleprice":12100,"qty":3,"part_hb":"ER16-7.0"},{"part_jj":"","order_no":"91174-30-1","part_no":"1-30-004090","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER16-8.0"},{"part_jj":"","order_no":"91174-31-1","part_no":"1-30-004091","shipto_name":"재고용","amount":36300,"ordernum_cust":"","unit_saleprice":12100,"qty":3,"part_hb":"ER16-9.0"},{"part_jj":"","order_no":"91174-32-1","part_no":"1-30-004092","shipto_name":"재고용","amount":60500,"ordernum_cust":"","unit_saleprice":12100,"qty":5,"part_hb":"ER16-10.0"},{"part_jj":"","order_no":"91174-23-1","part_no":"1-30-004092","shipto_name":"재고용","amount":60500,"ordernum_cust":"","unit_saleprice":12100,"qty":5,"part_hb":"ER16-10.0"},{"part_jj":"","order_no":"91174-37-1","part_no":"1-30-004095","shipto_name":"재고용","amount":60500,"ordernum_cust":"","unit_saleprice":12100,"qty":5,"part_hb":"ER20-2.0"},{"part_jj":"","order_no":"91174-38-1","part_no":"1-30-004096","shipto_name":"재고용","amount":242000,"ordernum_cust":"","unit_saleprice":12100,"qty":20,"part_hb":"ER20-3.0"},{"part_jj":"","order_no":"91174-39-1","part_no":"1-30-004097","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER20-4.0"},{"part_jj":"","order_no":"91174-40-1","part_no":"1-30-004098","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER20-5.0"},{"part_jj":"","order_no":"91174-41-1","part_no":"1-30-004099","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER20-6.0"},{"part_jj":"","order_no":"91174-33-1","part_no":"1-30-004103","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER20-10.0"},{"part_jj":"","order_no":"91174-34-1","part_no":"1-30-004104","shipto_name":"재고용","amount":36300,"ordernum_cust":"","unit_saleprice":12100,"qty":3,"part_hb":"ER20-11.0"},{"part_jj":"","order_no":"91174-36-1","part_no":"1-30-004106","shipto_name":"재고용","amount":24200,"ordernum_cust":"","unit_saleprice":12100,"qty":2,"part_hb":"ER20-13.0"},{"part_jj":"","order_no":"91174-14-1","part_no":"1-30-004591","shipto_name":"재고용","amount":522500,"ordernum_cust":"","unit_saleprice":10450,"qty":50,"part_hb":"P50T-1"},{"part_jj":"","order_no":"91174-17-1","part_no":"1-30-004591","shipto_name":"재고용","amount":104500,"ordernum_cust":"","unit_saleprice":10450,"qty":10,"part_hb":"P50T-1"},{"part_jj":"","order_no":"91174-15-1","part_no":"1-30-004592","shipto_name":"재고용","amount":104500,"ordernum_cust":"","unit_saleprice":10450,"qty":10,"part_hb":"P50T-1(7)"},{"part_jj":"","order_no":"91174-16-1","part_no":"1-30-004602","shipto_name":"재고용","amount":104500,"ordernum_cust":"","unit_saleprice":10450,"qty":10,"part_hb":"PS50-1F"},{"part_jj":"","order_no":"91174-13-1","part_no":"1-30-004664","shipto_name":"재고용","amount":412500,"ordernum_cust":"","unit_saleprice":8250,"qty":50,"part_hb":"P40T-1(3)"},{"part_jj":"","order_no":"91174-1-1","part_no":"1-30-013473","shipto_name":"재고용","amount":221100,"ordernum_cust":"","unit_saleprice":110550,"qty":2,"part_hb":"BT50-DSK10-165"},{"part_jj":"","order_no":"91174-2-1","part_no":"1-30-013475","shipto_name":"재고용","amount":306900,"ordernum_cust":"","unit_saleprice":102300,"qty":3,"part_hb":"BT50-DSK16-105"},{"part_jj":"","order_no":"91174-3-1","part_no":"1-30-013476","shipto_name":"재고용","amount":338250,"ordernum_cust":"","unit_saleprice":112750,"qty":3,"part_hb":"BT50-DSK16-135"},{"part_jj":"","order_no":"91174-4-1","part_no":"1-30-013477","shipto_name":"재고용","amount":237600,"ordernum_cust":"","unit_saleprice":118800,"qty":2,"part_hb":"BT50-DSK16-165"},{"part_jj":"","order_no":"91174-5-1","part_no":"1-30-013479","shipto_name":"재고용","amount":212300,"ordernum_cust":"","unit_saleprice":106150,"qty":2,"part_hb":"BT50-DSK20-105"},{"part_jj":"","order_no":"91174-6-1","part_no":"1-30-013480","shipto_name":"재고용","amount":217800,"ordernum_cust":"","unit_saleprice":108900,"qty":2,"part_hb":"BT50-DSK20-135"},{"part_jj":"","order_no":"91174-7-1","part_no":"1-30-013481","shipto_name":"재고용","amount":121550,"ordernum_cust":"","unit_saleprice":121550,"qty":1,"part_hb":"BT50-DSK20-165"},{"part_jj":"","order_no":"91182-1-1","part_no":"1-30-004100","shipto_name":"재고용","amount":60500,"ordernum_cust":"","unit_saleprice":12100,"qty":5,"part_hb":"ER20-7.0"},{"part_jj":"","order_no":"91182-2-1","part_no":"1-30-004101","shipto_name":"재고용","amount":121000,"ordernum_cust":"","unit_saleprice":12100,"qty":10,"part_hb":"ER20-8.0"},{"part_jj":"","order_no":"91182-3-1","part_no":"1-30-004102","shipto_name":"재고용","amount":60500,"ordernum_cust":"","unit_saleprice":12100,"qty":5,"part_hb":"ER20-9.0"},{"part_jj":"","order_no":"91182-43-1","part_no":"1-30-004124","shipto_name":"재고용","amount":41250,"ordernum_cust":"","unit_saleprice":13750,"qty":3,"part_hb":"ER32-3.0"},{"part_jj":"","order_no":"91182-44-1","part_no":"1-30-004125","shipto_name":"재고용","amount":68750,"ordernum_cust":"","unit_saleprice":13750,"qty":5,"part_hb":"ER32-4.0"},{"part_jj":"","order_no":"91182-38-1","part_no":"1-30-004131","shipto_name":"재고용","amount":68750,"ordernum_cust":"","unit_saleprice":13750,"qty":5,"part_hb":"ER32-10.0"},{"part_jj":"","order_no":"91182-39-1","part_no":"1-30-004133","shipto_name":"재고용","amount":68750,"ordernum_cust":"","unit_saleprice":13750,"qty":5,"part_hb":"ER32-12.0"},{"part_jj":"","order_no":"91182-40-1","part_no":"1-30-004135","shipto_name":"재고용","amount":41250,"ordernum_cust":"","unit_saleprice":13750,"qty":3,"part_hb":"ER32-14.0"},{"part_jj":"","order_no":"91182-41-1","part_no":"1-30-004137","shipto_name":"재고용","amount":68750,"ordernum_cust":"","unit_saleprice":13750,"qty":5,"part_hb":"ER32-16.0"},{"part_jj":"","order_no":"91182-42-1","part_no":"1-30-004142","shipto_name":"재고용","amount":68750,"ordernum_cust":"","unit_saleprice":13750,"qty":5,"part_hb":"ER32-20.0"},{"part_jj":"1300101","order_no":"91182-19-1","part_no":"1-30-013070","shipto_name":"재고용","amount":52800,"ordernum_cust":"","unit_saleprice":17600,"qty":3,"part_hb":"02.00 RD GER16-B(사용중지)"},{"part_jj":"13001","order_no":"91182-20-1","part_no":"1-30-013075","shipto_name":"재고용","amount":176000,"ordernum_cust":"","unit_saleprice":17600,"qty":10,"part_hb":"06.00 RD GER16-B(단종)"},{"part_jj":"13001","order_no":"91182-21-1","part_no":"1-30-013080","shipto_name":"재고용","amount":88000,"ordernum_cust":"","unit_saleprice":17600,"qty":5,"part_hb":"10.00 RD GER16-B"},{"part_jj":"13002","order_no":"91182-22-1","part_no":"1-30-013086","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"03.00 RD GER20-B(사용중지)"},{"part_jj":"13002","order_no":"91182-23-1","part_no":"1-30-013088","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"04.00 RD GER20-B(사용중지)"},{"part_jj":"13002","order_no":"91182-24-1","part_no":"1-30-013090","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"05.00 RD GER20-B(단종)"},{"part_jj":"13002","order_no":"91182-25-1","part_no":"1-30-013092","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"06.00 RD GER20-B(사용중지)"},{"part_jj":"13002","order_no":"91182-26-1","part_no":"1-30-013096","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"08.00 RD GER20-B(단종)"},{"part_jj":"13002","order_no":"91182-27-1","part_no":"1-30-013099","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"10.00 RD GER20-B"},{"part_jj":"13002","order_no":"91182-28-1","part_no":"1-30-013103","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"12.00 RD GER20-B(단종)"},{"part_jj":"13003","order_no":"91182-29-1","part_no":"1-30-013108","shipto_name":"재고용","amount":187000,"ordernum_cust":"","unit_saleprice":18700,"qty":10,"part_hb":"03.00 RD GER25-B(단종)"},{"part_jj":"13003","order_no":"91182-30-1","part_no":"1-30-013109","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"04.00 RD GER25-B"},{"part_jj":"13003","order_no":"91182-31-1","part_no":"1-30-013110","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"05.00 RD GER25-B(단종)"},{"part_jj":"13003","order_no":"91182-32-1","part_no":"1-30-013111","shipto_name":"재고용","amount":280500,"ordernum_cust":"","unit_saleprice":18700,"qty":15,"part_hb":"06.00 RD GER25-B(단종)"},{"part_jj":"13003","order_no":"91182-33-1","part_no":"1-30-013113","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"08.00 RD GER25-B(단종)"},{"part_jj":"13003","order_no":"91182-34-1","part_no":"1-30-013116","shipto_name":"재고용","amount":280500,"ordernum_cust":"","unit_saleprice":18700,"qty":15,"part_hb":"10.00 RD GER25-B"},{"part_jj":"13003","order_no":"91182-35-1","part_no":"1-30-013118","shipto_name":"재고용","amount":56100,"ordernum_cust":"","unit_saleprice":18700,"qty":3,"part_hb":"12.00 RD GER25-B(단종)"},{"part_jj":"13003","order_no":"91182-36-1","part_no":"1-30-013120","shipto_name":"재고용","amount":112200,"ordernum_cust":"","unit_saleprice":18700,"qty":6,"part_hb":"14.00 RD GER25-B(단종)"},{"part_jj":"13003","order_no":"91182-37-1","part_no":"1-30-013122","shipto_name":"재고용","amount":112200,"ordernum_cust":"","unit_saleprice":18700,"qty":6,"part_hb":"16.00 RD GER25-B(단종)"},{"part_jj":"","order_no":"91228-22-1","part_no":"1-30-002431","shipto_name":"재고용","amount":61600,"ordernum_cust":"","unit_saleprice":61600,"qty":1,"part_hb":"TCA2-M8"},{"part_jj":"","order_no":"91228-26-1","part_no":"1-30-002443","shipto_name":"재고용","amount":61600,"ordernum_cust":"","unit_saleprice":61600,"qty":1,"part_hb":"TCA2-M16"},{"part_jj":"","order_no":"91228-27-1","part_no":"1-30-002444","shipto_name":"재고용","amount":61600,"ordernum_cust":"","unit_saleprice":61600,"qty":1,"part_hb":"TCA2-M18"},{"part_jj":"","order_no":"91228-28-1","part_no":"1-30-002445","shipto_name":"재고용","amount":61600,"ordernum_cust":"","unit_saleprice":61600,"qty":1,"part_hb":"TCA2-M20"},{"part_jj":"","order_no":"91228-30-1","part_no":"1-30-002462","shipto_name":"재고용","amount":61600,"ordernum_cust":"","unit_saleprice":61600,"qty":1,"part_hb":"TCA2-P1/4"},{"part_jj":"","order_no":"91228-32-1","part_no":"1-30-002464","shipto_name":"재고용","amount":61600,"ordernum_cust":"","unit_saleprice":61600,"qty":1,"part_hb":"TCA2-P1/2"},{"part_jj":"","order_no":"91228-23-1","part_no":"1-30-002466","shipto_name":"재고용","amount":61600,"ordernum_cust":"","unit_saleprice":61600,"qty":1,"part_hb":"TCA2-M10"},{"part_jj":"","order_no":"91228-24-1","part_no":"1-30-002468","shipto_name":"재고용","amount":61600,"ordernum_cust":"","unit_saleprice":61600,"qty":1,"part_hb":"TCA2-M12"},{"part_jj":"","order_no":"91228-25-1","part_no":"1-30-002469","shipto_name":"재고용","amount":61600,"ordernum_cust":"","unit_saleprice":61600,"qty":1,"part_hb":"TCA2-M14"},{"part_jj":"","order_no":"91228-1-1","part_no":"1-30-004126","shipto_name":"재고용","amount":68750,"ordernum_cust":"","unit_saleprice":13750,"qty":5,"part_hb":"ER32-5.0"},{"part_jj":"","order_no":"91228-2-1","part_no":"1-30-004127","shipto_name":"재고용","amount":68750,"ordernum_cust":"","unit_saleprice":13750,"qty":5,"part_hb":"ER32-6.0"},{"part_jj":"","order_no":"91228-3-1","part_no":"1-30-004129","shipto_name":"재고용","amount":68750,"ordernum_cust":"","unit_saleprice":13750,"qty":5,"part_hb":"ER32-8.0"},{"part_jj":"","order_no":"91228-42-1","part_no":"1-30-005491","shipto_name":"재고용","amount":55000,"ordernum_cust":"","unit_saleprice":11000,"qty":5,"part_hb":"C32-12(단종)"},{"part_jj":"","order_no":"91228-43-1","part_no":"1-30-005493","shipto_name":"재고용","amount":55000,"ordernum_cust":"","unit_saleprice":11000,"qty":5,"part_hb":"C32-20(단종)"},{"part_jj":"","order_no":"91228-44-1","part_no":"1-30-005494","shipto_name":"재고용","amount":55000,"ordernum_cust":"","unit_saleprice":11000,"qty":5,"part_hb":"C32-25(단종)"},{"part_jj":"","order_no":"91228-52-1","part_no":"1-30-005501","shipto_name":"재고용","amount":71500,"ordernum_cust":"","unit_saleprice":14300,"qty":5,"part_hb":"C42-20(단종)"},{"part_jj":"","order_no":"91228-45-1","part_no":"1-30-005509","shipto_name":"재고용","amount":16500,"ordernum_cust":"","unit_saleprice":8250,"qty":2,"part_hb":"TC32-1"},{"part_jj":"","order_no":"91228-46-1","part_no":"1-30-005510","shipto_name":"재고용","amount":41250,"ordernum_cust":"","unit_saleprice":8250,"qty":5,"part_hb":"TC32-2"},{"part_jj":"","order_no":"91228-47-1","part_no":"1-30-005511","shipto_name":"재고용","amount":24750,"ordernum_cust":"","unit_saleprice":8250,"qty":3,"part_hb":"TC32-3"},{"part_jj":"","order_no":"91228-48-1","part_no":"1-30-005512","shipto_name":"재고용","amount":26400,"ordernum_cust":"","unit_saleprice":13200,"qty":2,"part_hb":"TC42-1"},{"part_jj":"","order_no":"91228-49-1","part_no":"1-30-005513","shipto_name":"재고용","amount":39600,"ordernum_cust":"","unit_saleprice":13200,"qty":3,"part_hb":"TC42-2"},{"part_jj":"","order_no":"91228-50-1","part_no":"1-30-005514","shipto_name":"재고용","amount":39600,"ordernum_cust":"","unit_saleprice":13200,"qty":3,"part_hb":"TC42-3"},{"part_jj":"","order_no":"91228-51-1","part_no":"1-30-005515","shipto_name":"재고용","amount":26400,"ordernum_cust":"","unit_saleprice":13200,"qty":2,"part_hb":"TC42-4"},{"part_jj":"","order_no":"91228-39-1","part_no":"1-30-009223","shipto_name":"재고용","amount":30800,"ordernum_cust":"","unit_saleprice":6160,"qty":5,"part_hb":"68-72"},{"part_jj":"","order_no":"91228-34-1","part_no":"1-30-009243","shipto_name":"재고용","amount":14600,"ordernum_cust":"","unit_saleprice":2920,"qty":5,"part_hb":"35-38"},{"part_jj":"","order_no":"91228-36-1","part_no":"1-30-009244","shipto_name":"재고용","amount":24750,"ordernum_cust":"","unit_saleprice":4950,"qty":5,"part_hb":"48-52"},{"part_jj":"","order_no":"91228-38-1","part_no":"1-30-009263","shipto_name":"재고용","amount":26700,"ordernum_cust":"","unit_saleprice":5340,"qty":5,"part_hb":"62-65"},{"part_jj":"","order_no":"91228-37-1","part_no":"1-30-009313","shipto_name":"재고용","amount":26700,"ordernum_cust":"","unit_saleprice":5340,"qty":5,"part_hb":"57-60"},{"part_jj":"","order_no":"91228-41-1","part_no":"1-30-009314","shipto_name":"재고용","amount":33300,"ordernum_cust":"","unit_saleprice":6660,"qty":5,"part_hb":"92-96"},{"part_jj":"","order_no":"91228-40-1","part_no":"1-30-009340","shipto_name":"재고용","amount":30800,"ordernum_cust":"","unit_saleprice":6160,"qty":5,"part_hb":"75-79"},{"part_jj":"","order_no":"91228-33-1","part_no":"1-30-009453","shipto_name":"재고용","amount":25600,"ordernum_cust":"","unit_saleprice":5120,"qty":5,"part_hb":"32-35"},{"part_jj":"","order_no":"91228-35-1","part_no":"1-30-009460","shipto_name":"재고용","amount":30800,"ordernum_cust":"","unit_saleprice":6160,"qty":5,"part_hb":"42-46"},{"part_jj":"","order_no":"91228-6-1","part_no":"1-30-013489","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":19800,"qty":5,"part_hb":"HC6-5.0"},{"part_jj":"","order_no":"91228-7-1","part_no":"1-30-013491","shipto_name":"재고용","amount":70950,"ordernum_cust":"","unit_saleprice":23650,"qty":3,"part_hb":"HC10-2.0"},{"part_jj":"","order_no":"91228-8-1","part_no":"1-30-013494","shipto_name":"재고용","amount":85250,"ordernum_cust":"","unit_saleprice":17050,"qty":5,"part_hb":"HC10-5.0"},{"part_jj":"","order_no":"91228-9-1","part_no":"1-30-013500","shipto_name":"재고용","amount":96250,"ordernum_cust":"","unit_saleprice":19250,"qty":5,"part_hb":"HC16-3.0"},{"part_jj":"","order_no":"91228-10-1","part_no":"1-30-013502","shipto_name":"재고용","amount":96250,"ordernum_cust":"","unit_saleprice":19250,"qty":5,"part_hb":"HC16-5.0"},{"part_jj":"","order_no":"91228-11-1","part_no":"1-30-013503","shipto_name":"재고용","amount":96250,"ordernum_cust":"","unit_saleprice":19250,"qty":5,"part_hb":"HC16-6.0"},{"part_jj":"","order_no":"91228-12-1","part_no":"1-30-013504","shipto_name":"재고용","amount":96250,"ordernum_cust":"","unit_saleprice":19250,"qty":5,"part_hb":"HC16-7.0"},{"part_jj":"","order_no":"91228-13-1","part_no":"1-30-013509","shipto_name":"재고용","amount":90750,"ordernum_cust":"","unit_saleprice":18150,"qty":5,"part_hb":"HC16-12.0"},{"part_jj":"","order_no":"91228-14-1","part_no":"1-30-013518","shipto_name":"재고용","amount":90750,"ordernum_cust":"","unit_saleprice":18150,"qty":5,"part_hb":"HC16-16.0"},{"part_jj":"","order_no":"91228-15-1","part_no":"1-30-013519","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":19800,"qty":5,"part_hb":"HC20-4.0"},{"part_jj":"","order_no":"91228-17-1","part_no":"1-30-013521","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":19800,"qty":5,"part_hb":"HC20-6.0"},{"part_jj":"","order_no":"91228-18-1","part_no":"1-30-013523","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":19800,"qty":5,"part_hb":"HC20-8.0"},{"part_jj":"","order_no":"91228-19-1","part_no":"1-30-013525","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":19800,"qty":5,"part_hb":"HC20-10.0"},{"part_jj":"","order_no":"91228-20-1","part_no":"1-30-013527","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":19800,"qty":5,"part_hb":"HC20-12.0"},{"part_jj":"","order_no":"91228-21-1","part_no":"1-30-013531","shipto_name":"재고용","amount":99000,"ordernum_cust":"","unit_saleprice":19800,"qty":5,"part_hb":"HC20-16.0"},{"part_jj":"","order_no":"91228-16-1","part_no":"1-30-013520","shipto_name":"재고용","amount":59400,"ordernum_cust":"","unit_saleprice":19800,"qty":3,"part_hb":"HC20-5.0"}],"pagetotal_sale_price":49465750,"pagetotal_amount":49465750,"pagetotal_tax":0}],"res_msg":null,"paging_info":{"total_page_cnt":1,"total_cnt":193,"cnt_per_page":0,"page_no":1,"max_cnt":0,"sort":null},"res_code":200,"header_info":[{"customer_address":"서울 구로구 구로동 604-1 기계공구상가 C-23  103,104,203,204호 ","dine_saup_no":"1128136590","customer_ceo":"황명주","customer_saup_no":"113-86-15031","dine_customer_name":"(주)다인정공(본사)","dine_address":"경기도 시흥시 엠티브이 26로 24  ","customer_name":"(주)현대상공사","gb":"S","dine_ceo":"윤혜섭외1명"}]}';






    $scope.isprint = false;
    
   $scope.getPDF = function( ){
    	$scope.isprint = true;
    	
    	var d = new Date();
    	var current_datetime = d.getFullYear()+'.'+(d.getMonth() + 1 )+'.'+d.getDate()
        +' '+ d.getHours()+':'+ d.getMinutes()+':'+d.getSeconds();
    	
    	//다운로드할 PDF파일 명
    	var pdf_name = "trading_statement_"+current_datetime+".pdf";

    	//여기서는 팝업창의 스크롤을 제거해서 다 펼침
    	document.getElementById('trStateView2').parentNode.style.overflow = 'visible';
    	
    	
    	var node = document.getElementById('trStateView2');
    	
    	
    	//아래 코드에서는 커서가 스크롤 하단에 있더라도 상단으로 커서 위치 시킴
    	$(window).scrollTop(0);
    	$('#trStateView').animate({
            scrollTop: $("#trStateView2").offset().top
        }, 500);
    	console.log(node);
    	
        html2canvas(node).then(             
            function (canvas) {

            	//이미지 떳으니까 팝업창 원래대로 복원
            	document.getElementById('trStateView2').parentNode.style.overflow = 'auto';
           
            	var ctx = canvas.getContext('2d');
                getCanvas = canvas;
            	 var imgageData = getCanvas.toDataURL("image/jpeg", 1.0);
             	
             	var imgWidth = 210; 
             	var pageHeight = 295;  
             	var imgHeight = canvas.height * imgWidth / canvas.width;
             	var heightLeft = imgHeight;
             	var doc = new jsPDF('p', 'mm', 'a4');
             
             	
             	var position = 0;
             	var options = {
             	         pagesplit: true
             	    };
             	doc.addImage(imgageData, 'PNG', 0, position, imgWidth, imgHeight);
             	heightLeft -= pageHeight;

             	while (heightLeft >= 0) {
             	  position = heightLeft - imgHeight;
             	  doc.addPage();
             	  doc.addImage(imgageData, 'PNG', 0, position, imgWidth, imgHeight);
             	  heightLeft -= pageHeight;
             	}
             	doc.save( pdf_name);
            }
        );
    }  


    console.log(a, d, e); // 1, 2, 3



    var dataObj = JSON.parse(str);

    $scope.dt = {};

    $scope.dt.data = dataObj;
    $scope.dt.header_info = dataObj.header_info;
    $scope.dt.total = dataObj.data_list[0];
    $scope.dt.data_list = dataObj.data_list[0].data_list;



    var Paper = new Map();
    Paper.set('A0',  {w : 841, h : 1189 });
    Paper.set('A1',  {w : 594, h : 841 });
    Paper.set('A2',  {w : 420, h : 594 });
    Paper.set('A3',  {w : 297, h : 420 });
    Paper.set('A4',  {w : 210, h : 297 });
    Paper.set('A5',  {w : 148, h : 210 });
    Paper.set('A6',  {w : 105, h : 148 });
    Paper.set('A7',  {w : 74, h : 105 });
    Paper.set('A8',  {w : 52, h : 74 });
    Paper.set('B0',  {w : 1000, h : 1414 });
    Paper.set('B1',  {w : 707, h : 1000 });
    Paper.set('B2',  {w : 500, h : 707 });
    Paper.set('B3',  {w : 353, h : 500 });
    Paper.set('B4',  {w : 250, h : 353 });
    Paper.set('B5',  {w : 176, h : 250 });
    Paper.set('B6',  {w : 125, h : 176 });
    Paper.set('B7',  {w : 88, h : 125 });
    Paper.set('B8',  {w : 62, h : 88 });

    var ScreenWidth = 1000;
    var paperType = Paper.get("A4");
    var OPP = ScreenWidth * paperType.h / paperType.w;


    var pageInfo = {};
    pageInfo.from = 0;
    pageInfo.to = 0;
    pageInfo.curPage = 1;
    pageInfo.preH = 0;
    pageInfo.toth = 0;
    pageInfo.bFirst = true;
    pageInfo.bPrintTail = false;
    pageInfo.curBody = {};
    pageInfo.curTable = {};
    pageInfo.tableArea = {};
    pageInfo.tableAreaName = {};



    function getHeightByName(myid) {

        var elHeight = $('#' + myid).outerHeight(true);
  	
    	return elHeight;
    	

    }

    function getHeight(obj) {
    	
		return $(obj).outerHeight(true);
		
	/*	
    	var height = 0;
        var cname = obj.getAttribute("id");
        if(cname == null){
            var cname = obj.getAttribute("class");
            if(cname == null){
                height = $(obj).outerHeight(true);
            }else{
                height = $("." + cname).outerHeight(true);
            }
        }else{
            height = $("#" + cname).outerHeight(true);
        }
        

        return height;
        */
    }
    

    function addTableHead(data){
        {
            var tcg = document.createElement('colgroup');

            var c1 = document.createElement('col');
            c1.setAttribute("style", "width:10%;");
            tcg.appendChild( c1 );

            c1 = document.createElement('col');
            c1.setAttribute("style", "width:10%;");
            tcg.appendChild( c1 );

            c1 = document.createElement('col');
            c1.setAttribute("style", "width:10%;");
            tcg.appendChild( c1 );

            c1 = document.createElement('col');
            c1.setAttribute("style", "width:10%;");
            tcg.appendChild( c1 );

            c1 = document.createElement('col');
            c1.setAttribute("style", "width:5%;");
            tcg.appendChild( c1 );

            c1 = document.createElement('col');
            c1.setAttribute("style", "width:10%;");
            tcg.appendChild( c1 );

            c1 = document.createElement('col');
            c1.setAttribute("style", "width:10%;");
            tcg.appendChild( c1 );

            c1 = document.createElement('col');
            c1.setAttribute("style", "width:10%;");
            tcg.appendChild( c1 );

            c1 = document.createElement('col');
            c1.setAttribute("style", "width:10%;");
            tcg.appendChild( c1 );

            c1 = document.createElement('col');
            c1.setAttribute("style", "width:15%;");
            tcg.appendChild( c1 );


            pageInfo.curTable.appendChild(tcg);
        }

        {
            var thead = document.createElement('thead');

            var thr1 = document.createElement('tr');

            th1 = document.createElement('th');
            thr1.appendChild( th1 );
            thr1.cells[0].appendChild( document.createTextNode('주문정보'));

            th1 = document.createElement('th');
            th1.setAttribute("colspan", "9");
            thr1.appendChild( th1 );
            thr1.cells[1].appendChild( document.createTextNode('주문정보'));

            thead.appendChild(thr1);


            var thr = document.createElement('tr');

            thr.appendChild( document.createElement('th') );
            thr.appendChild( document.createElement('th') );
            thr.appendChild( document.createElement('th') );
            thr.appendChild( document.createElement('th') );
            thr.appendChild( document.createElement('th') );
            thr.appendChild( document.createElement('th') );
            thr.appendChild( document.createElement('th') );
            thr.appendChild( document.createElement('th') );
            thr.appendChild( document.createElement('th') );
            thr.appendChild( document.createElement('th') );

            thr.cells[0].appendChild( document.createTextNode('유형'));
            thr.cells[1].appendChild( document.createTextNode('품번') );
            thr.cells[2].appendChild( document.createTextNode('형번') );
            thr.cells[3].appendChild( document.createTextNode('재종') );
            thr.cells[4].appendChild( document.createTextNode('수량') );
            thr.cells[5].appendChild( document.createTextNode('단가') );
            thr.cells[6].appendChild( document.createTextNode('금액') );
            thr.cells[7].appendChild( document.createTextNode('접수번호') );
            thr.cells[8].appendChild( document.createTextNode('배송처명') );
            thr.cells[9].appendChild( document.createTextNode('주문번호') );
            thead.appendChild(thr);
            pageInfo.curTable.appendChild(thead);
        }
    }

    function createTable()
    {
        pageInfo.tableArea = document.getElementById(pageInfo.tableAreaName);
        pageInfo.curTable = document.createElement('table');

        pageInfo.curTable.setAttribute("class", "table2");
        pageInfo.curTable.setAttribute("id", "tid" + pageInfo.curPage);

        pageInfo.tableArea.appendChild(pageInfo.curTable);
    }

    function createTableBody()
    {
        pageInfo.curBody = document.createElement('tbody');
        pageInfo.curTable.appendChild(pageInfo.curBody);
    }

    function numCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }



    function addOneRow(data)
    {
        var i = pageInfo.from;
        if ( pageInfo.from < pageInfo.to) {
            var tr = document.createElement('tr');

            tr.appendChild( document.createElement('td') );
            tr.appendChild( document.createElement('td') );
            tr.appendChild( document.createElement('td') );
            tr.appendChild( document.createElement('td') );
            tr.appendChild( document.createElement('td') );
            tr.appendChild( document.createElement('td') );
            tr.appendChild( document.createElement('td') );
            tr.appendChild( document.createElement('td') );
            tr.appendChild( document.createElement('td') );
            tr.appendChild( document.createElement('td') );

            tr.cells[0].appendChild( document.createTextNode(''));
            tr.cells[1].appendChild( document.createTextNode(data[i].part_no) );
            tr.cells[2].appendChild( document.createTextNode(data[i].part_hb) );
            tr.cells[3].appendChild( document.createTextNode(data[i].part_jj) );
            tr.cells[4].appendChild( document.createTextNode(numCommas(data[i].qty) ));
            tr.cells[5].appendChild( document.createTextNode(numCommas(data[i].unit_saleprice)) );
            tr.cells[6].appendChild( document.createTextNode(numCommas(data[i].amount) ));
            tr.cells[7].appendChild( document.createTextNode(data[i].ordernum_cust) );
            tr.cells[8].appendChild( document.createTextNode(data[i].shipto_name) );
            tr.cells[9].appendChild( document.createTextNode(data[i].order_no) );

            pageInfo.curBody.appendChild(tr);
        }
    }


    function bNextPage(headH, tailH)
    {
        var bodyH = getHeight(pageInfo.curTable) + 10;

        if(pageInfo.bFirst){
            if(pageInfo.bPrintTail){
                pageInfo.toth = headH + bodyH;
            }else{
                pageInfo.toth = headH + bodyH  + tailH;
            }
        }else{
            if(pageInfo.bPrintTail){
                pageInfo.toth = bodyH;
            }else{
                pageInfo.toth = bodyH  + tailH;
            }
        }

        if((pageInfo.preH + pageInfo.toth + 50) < (OPP * pageInfo.curPage)) {
            return false;
        }else{
            if(!pageInfo.bPrintTail){
                if(( pageInfo.preH + pageInfo.toth - tailH + 50) < ( OPP * pageInfo.curPage )){
                    pageInfo.bPrintTail = true;
                    return false;
                }
            }

            pageInfo.preH = OPP * pageInfo.curPage;
            pageInfo.toth = 0;
            pageInfo.curPage += 1;
            pageInfo.bPrintTail = false;
            return true;
        }
    }


    function deleteOneRow() {
        var x = pageInfo.curTable.rows.length;
        pageInfo.curTable.deleteRow(x-1);
    }



    function createSpace(headH ){
		 pageInfo.space = document.createElement('div');
		 
		 var height = 0;
		 
		 if(pageInfo.bFirst){
			 height = OPP-(headH + getHeight(pageInfo.curTable));
		 }else{
			 height = OPP-(getHeight(pageInfo.curTable));
		 }
		 
		 pageInfo.bFirst = false;
		 console.log('height : ' + height);
		 pageInfo.space.setAttribute("style", "height:" + height + "px;");
		
		 pageInfo.tableArea.appendChild(pageInfo.space);
    }


    function addTable(data, headH, tailH){
        createTable();
        addTableHead(data);
        createTableBody();

        while( pageInfo.from < pageInfo.to ) {
            if(bNextPage(headH, tailH)){
                deleteOneRow();

                pageInfo.from -= 1;

                createSpace(headH);

                createTable();
                addTableHead(data);
                createTableBody();
            }else{
                addOneRow(data);
                pageInfo.from += 1;
            }
        }
    }


    function addElement()
    {
        var hheight = getHeightByName("pdfHeader");
        hheight += getHeightByName("tableHeader");

        var fh = getHeightByName("tail");

        pageInfo.from = 0;

        pageInfo.to = $scope.dt.data_list.length;
        pageInfo.tableAreaName = "tableBody";

        addTable($scope.dt.data_list, hheight, fh);


        $scope.getPDF();
    }

    addElement();
}]);
