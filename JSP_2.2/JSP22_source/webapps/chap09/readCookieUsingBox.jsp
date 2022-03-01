<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "util.CookieBox" %>
<%
	CookieBox cookieBox = new CookieBox(request);
%>
<html>
<head><title>Cookie 사용</title></head>
<body>

name 쿠키 = <%= cookieBox.getValue("name") %> <br>
<%  if (cookieBox.exists("id")) { %>
id 쿠키 = <%= cookieBox.getValue("id") %> <br>
<%  }  %>
</body>
</html>
