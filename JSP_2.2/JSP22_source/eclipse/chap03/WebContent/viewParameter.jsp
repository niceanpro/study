<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head><title>��û �Ķ���� ���</title></head>
<body>


Ŭ���̾�ƮIP = <%= request.getRemoteAddr() %> <br>
��û�������� = <%= request.getContentLength() %> <br>
��û���� ���ڵ� = <%= request.getCharacterEncoding() %> <br>
��û���� ����ƮŸ�� = <%= request.getContentType() %> <br>
��û���� �������� = <%= request.getProtocol() %> <br>
��û���� ���۹�� = <%= request.getMethod() %> <br>
��û URI = <%= request.getRequestURI() %> <br>
���ؽ�Ʈ ��� = <%= request.getContextPath() %> <br>
�����̸� = <%= request.getServerName() %> <br>
������Ʈ = <%= request.getServerPort() %> <br>


<br><br>
<b>request.getParameter() �޼��� ���</b><br>
name �Ķ���� = <%= request.getParameter("name") %> <br>
address �Ķ���� = <%= request.getParameter("address") %>
<p>
<b>request.getParameterValues() �޼��� ���</b><br>
<%
	String[] values = request.getParameterValues("pet");
	if (values != null) {
	for (int i = 0 ; i < values.length ; i++) {
%>
	<%= values[i] %>
<%
		}
	}
%>
<p>
<b>request.getParameterNames() �޼��� ���</b><br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name = (String)paramEnum.nextElement();
%>
		<%= name %>
<%
	}
%>
<p>
<b>request.getParameterMap() �޼��� ���</b><br>
<%
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("name");
	if (nameParam != null) {
%>
name = <%= nameParam[0] %>
<%
	}
%>
</body>
</html>
