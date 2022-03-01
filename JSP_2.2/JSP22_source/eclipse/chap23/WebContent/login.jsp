<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String memberId = request.getParameter("memberId");
	session.setAttribute("MEMBER", memberId);
%>
<html>
<head><title>로그인</title></head>
<body>
로그인 처리
</body>
</html>