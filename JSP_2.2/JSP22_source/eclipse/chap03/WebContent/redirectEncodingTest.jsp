<%@ page import = "java.net.URLEncoder" %>
<%@ page pageEncoding="euc-kr" %>
<%
	String value = "ÀÚ¹Ù";
	String encodedValue = URLEncoder.encode(value, "euc-kr");
	response.sendRedirect("/chap03/index.jsp?name=" + encodedValue);
%>
