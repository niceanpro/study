<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>실수 타입 사용 예</title></head>
<body>
<%
	double value = 3.2098e3;
%>
변수에 저장해서 사용: <%= value %>
<br>
표현식에서 직접 사용: <%= 3.2098e250 %>
</body>
</html>
