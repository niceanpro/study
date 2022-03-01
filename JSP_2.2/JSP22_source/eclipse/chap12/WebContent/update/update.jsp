<%@ page contentType = "text/html; charset=euc-kr" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("euc-kr");
	
	String memberID = request.getParameter("memberID");
	String name = request.getParameter("name");
	
	int updateCount = 0;
	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		String jdbcDriver = "jdbc:sqlserver://127.0.0.1:1433;databaseName=jspdb";
		String dbUser = "sa";
		String dbPass = "winlogic";
		
		String query = "update MEMBER set NAME = '"+name+"' "+
					   "where MEMBERID = '"+memberID+"'";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		updateCount = stmt.executeUpdate(query);
	} finally {
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
<html>
<head><title>이름 변경</title></head>
<body>
<%  if (updateCount > 0) { %>
<%= memberID %>의 이름을 <%= name %>(으)로 변경
<%  } else { %>
<%= memberID %> 아이디가 존재하지 않음
<%  } %>

</body>
</html>
