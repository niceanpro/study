<%@ page contentType = "text/html; charset=euc-kr" %>
<html>
<head><title>형변환시 값 손실 예제</title></head>
<body>
<%
	int val = 45000;
	short val2 = (short) val;
%>
<%= val %> 값을 short 타입으로 변환한 결과 -> <%= val2 %>
</body>
</html>
