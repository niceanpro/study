<%@ page contentType = "text/html; charset=euc-kr" %>
<%
	session.setAttribute("MEMBERID", "madvirus");
	session.setAttribute("NAME", "최범균");
%>
<html>
<head><title>세션에 정보 저장</title></head>
<body>

세션에 정보를 저장하였습니다.

<%
String nn = (String)session.getAttribute("NAME"); 
%>
<br>
name <%= nn %>

</body>
</html>
