<%@ tag body-content="scriptless" pageEncoding="euc-kr" %>
<%@ attribute name="var" required="true" rtexprvalue="false"%>
<%@ attribute name="base" type="java.lang.Integer" required="true" %>
<%@ variable name-from-attribute="var"
             variable-class="java.lang.Integer"
             alias="op2" scope="NESTED" %>
<%@ variable name-given="baseValue"
             variable-class="java.lang.Integer"
             scope="AT_BEGIN" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="baseValue" value="<%= base %>" />
<c:forEach var="count" begin="1" end="9">
    <c:set var="op2" value="${count}" />
    <jsp:doBody />
</c:forEach>
