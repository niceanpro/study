<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.util.Random" %>
<html>
<head><title>break 사용 예</title></head>
<body>
<%
	Random random = new Random();
	for (int i = 1 ; i <= 20 ; i++) {
		int number = random.nextInt(10) + 1;
%>
<%= i %> 번째 = <%= number %> <br>
<%
		if (number == 7) break;
	}
%>
</body>
</html>
