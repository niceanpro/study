<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>for 구문 사용 예</title></head>
<body>
<%
	int sum = 0;
	for (int i = 1 ; i <= 100 ; i++) {
		sum += i;
	}
%>
1부터 100까지의 합 = <%= sum %> <br>
<%
	sum = 0;
	for (int i = 1 ; i <= 100 ; i += 2) {
		sum += i;
	}
%>
1부터 100까지의 홀수의 합 = <%= sum %> <br>
<%
	sum = 0;
	for (int i = 2 ; i <= 100 ; i += 2) {
		sum += i;
	}
%>
1부터 100까지의 짝수의 합 = <%= sum %> <br>
</body>
</html>
