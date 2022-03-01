<%@ page contentType = "text/html; charset=euc-kr" %>
<html>
<head><title>영역 테스트</title></head>
<body>
<%
	{
		int i = 20;
		i ++;
%>
첫 번째 블록 내에서 i 값: <%= i %> <br>
<%
	}
%>

<%
	{
		int i = 30;
		i ++;
%>
두 번째 블록 내에서 i 값: <%= i %>
<%
	}
%>
</body>
</html>
