<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>while 구문 사용 예</title></head>
<body>
<%
	int sum = 0;
	int i = 1;
	while( i <= 100 ) {
		sum += i;
		i++;
	}
%>
1부터 100까지의 합 = <%= sum %> <br>
</body>
</html>
