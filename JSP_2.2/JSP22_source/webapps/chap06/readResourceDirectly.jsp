<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.io.*" %>
<html>
<head><title>절대 경로 사용하여 자원 읽기</title></head>
<body>

<%
	FileReader fr = null;
	char[] buff = new char[512];
	int len = -1;
	
	try {
		fr = new FileReader(
			"C:\\apache-tomcat-7.0.27\\webapps\\chap06"+
			"\\message\\notice\\notice.txt");
		
		while ( (len = fr.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
	} catch(IOException ex) {
		out.println("익셉션 발생: "+ex.getMessage());
	} finally {
		if (fr != null) try { fr.close(); } catch(IOException ex) {}
	}
%>

</body>
</html>
