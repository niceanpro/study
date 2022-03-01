<%@ tag body-content="tagdependent" pageEncoding="euc-kr" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:doBody var="bodyText" />
<c:out value="${bodyText}" escapeXml="true" />