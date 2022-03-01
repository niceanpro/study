<%@ page contentType = "text/html; charset=euc-kr" %>
<jsp:useBean id="member" scope="request"
        class="chap11.member.MemberInfo" />
<%
	member.setId("madvirus");
	member.setName("ÃÖ¹ü±Õ");
%>
<jsp:forward page="/useObject.jsp" />
