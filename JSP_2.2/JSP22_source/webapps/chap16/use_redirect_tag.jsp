<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${param.dest == '1'}">
	<c:redirect url="/use_c_set.jsp" />
</c:if>
<c:if test="${param.dest == '2'}">
	<c:redirect url="use_c_set.jsp" />
</c:if>
<c:if test="${param.dest == '3'}">
	<c:redirect url="/viewToday.jsp" context="/chap15" />
</c:if>
<c:if test="${param.dest == '4'}">
	<c:redirect url="http://search.daum.net/search">
		<c:param name="w" value="blog" />
		<c:param name="q" value="보라매 공원" />
	</c:redirect>
</c:if>
