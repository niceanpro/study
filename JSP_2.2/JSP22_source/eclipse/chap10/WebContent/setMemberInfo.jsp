<%@ page contentType = "text/html; charset=euc-kr" %>
<%
	session.setAttribute("MEMBERID", "madvirus");
	session.setAttribute("NAME", "�ֹ���");
%>
<html>
<head><title>���ǿ� ���� ����</title></head>
<body>

���ǿ� ������ �����Ͽ����ϴ�.

<%
String nn = (String)session.getAttribute("NAME"); 
%>
<br>
name <%= nn %>

</body>
</html>
