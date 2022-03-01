<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String id = request.getParameter("memberId");
	if (id.equals("madvirus")) {
		response.sendRedirect("/chap03/index.jsp");
	} else {
%>
<html>
<head><title>로그인에 실패</title></head>
<body>
잘못된 아이디입니다.
</body>
</html>
<%
	}
%>
