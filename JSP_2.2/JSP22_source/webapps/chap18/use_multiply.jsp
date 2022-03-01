<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<html>
<head><title>태그파일 사용한 loop</title></head>
<body>

<tf:multiply var="operand" base="2">
  ${baseValue} * ${operand} = ${baseValue * operand}<br>
</tf:multiply>
<hr>
<%= baseValue.intValue() %>의 실행 결과
</body>
</html>
