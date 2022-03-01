<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>수치 연산자 사용 예</title></head>
<body>
<%
	int operand1 = 10;
	int operand2 = 3;
%>
10 + 3 = <%= operand1 + operand2 %>  <br>
10 - 3 = <%= operand1 - operand2 %>  <br>
10 * 3 = <%= operand1 * operand2 %>  <br>
10 / 3 = <%= operand1 / operand2 %>  <br>
10 % 3 = <%= operand1 % operand2 %>  <br>

</body>
</html>
