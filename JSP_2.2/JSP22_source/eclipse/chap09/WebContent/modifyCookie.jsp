<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.net.URLEncoder" %>
<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i = 0 ; i < cookies.length ; i++) {
			if (cookies[i].getName().equals("name")) {
				Cookie cookie = new Cookie("name",
					URLEncoder.encode("JSP���α׷���", "euc-kr"));
				response.addCookie(cookie);
			}
		}
	}
%>
<html>
<head><title>�� ����</title></head>
<body>
name ��Ű�� ���� �����մϴ�.

<%-- <%
    Cookie[] resCook = response.getCookies();
    if(resCook != null && resCook.length > 0){
      for(int i = 0; i < resCook.length; i++){
          if(cookies[i].getName().equals("name")){
%>
    <%= resCook.getName() %>
    <%
    }
    }
    }
    %> --%>
</body>
</html>
