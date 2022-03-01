<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>String 메서드 예제</title></head>
<body>
<%
	String str1 = "첫 번째 문장. first string";
	String str2 = "두 번째 문장. First string";
%>
str1.length() = <%= str1.length() %> <br>
str1.charAt(5) = <%= str1.charAt(5) %> <br>
str1.indexOf("st") = <%= str1.indexOf("st") %> <br>
str1.indexOf("st", 12) = <%= str1.indexOf("st", 12) %> <br>
str1.indexOf('s') = <%= str1.indexOf('s') %> <br>
str1.indexOf('s', 12) = <%= str1.indexOf('s', 12) %> <br>
str1.substring(5) = <%= str1.substring(5) %> <br>
str1.substring(5, 10) = <%= str1.substring(5, 10) %> <br>
str1.equals(str2) = <%= str1.equals(str2) %> <br>
str1.compareTo(str2) = <%= str1.compareTo(str2) %> <br>
</body>
</html>
