<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.io.*" %>
<html>
<head><title>application �⺻ ��ü ����Ͽ� �ڿ� �б�</title></head>
<body>

<%
	String resourcePath = "/message/notice/notice.txt";
%>
�ڿ��� ���� ���:<br>
<%= application.getRealPath(resourcePath) %>
<br>
----------<br>
<%= resourcePath %>�� ����<br>
----------<br>
<%
	BufferedReader br = null;
	char[] buff = new char[512];
	int len = -1;
	
	try {
		br = new BufferedReader(
			new InputStreamReader(
				application.getResourceAsStream(resourcePath) ));
		while ( (len = br.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
	} catch(IOException ex) {
		out.println("�ͼ��� �߻�: "+ex.getMessage());
	} finally {
		if (br != null) try { br.close(); } catch(IOException ex) {}
	}
%>

</body>
</html>