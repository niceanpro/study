package mvjsp.chap13.dao.mssql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import mvjsp.chap13.dao.MessageDao;
import mvjsp.chap13.model.Message;
import mvjsp.jdbc.JdbcUtil;

public class MSSQLMessageDao extends MessageDao {

	public int insert(Connection conn, Message message) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
				"insert into guestbook_message " +
				"(guest_name, password, message) values (?, ?, ?)");
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public List<Message> selectList(Connection conn, int firstRow, int endRow)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			int fetchSize = endRow - firstRow + 1;
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM ( "
					+ "    SELECT TOP "+fetchSize + " * FROM ( " 
					+ "        SELECT TOP "+endRow+" * "
					+ "        FROM guestbook_message "
					+ "        ORDER BY message_id desc) as a "
					+ "    ORDER by message_id asc) as b "
					+ "ORDER by message_id desc");
			if (rs.next()) {
				List<Message> messageList = new ArrayList<Message>();
				do {
					messageList.add(super.makeMessageFromResultSet(rs));
				} while (rs.next());
				return messageList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

}
