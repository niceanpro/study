<%@ tag body-content="empty" pageEncoding="euc-kr" %>
<%@ tag import = "java.util.Calendar" %>
<%
	Calendar cal = Calendar.getInstance();
%>
<%= cal.get(Calendar.YEAR) %>³â
<%= cal.get(Calendar.MONTH)+1 %>¿ù
<%= cal.get(Calendar.DATE) %>ÀÏ
