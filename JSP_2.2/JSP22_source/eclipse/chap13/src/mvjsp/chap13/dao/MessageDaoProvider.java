package mvjsp.chap13.dao;

import mvjsp.chap13.dao.mssql.MSSQLMessageDao;
import mvjsp.chap13.dao.mysql.MySQLMessageDao;
import mvjsp.chap13.dao.oracle.OracleMessageDao;

public class MessageDaoProvider {
	private static MessageDaoProvider instance = new MessageDaoProvider();
	public static MessageDaoProvider getInstnace() {
		return instance;
	}
	private MessageDaoProvider() {}
	
	private MySQLMessageDao mysqlDao = new MySQLMessageDao();
	private OracleMessageDao oracleDao = new OracleMessageDao();
	private MSSQLMessageDao mssqlDao = new MSSQLMessageDao();
	private String dbms;
	
	void setDbms(String dbms) {
		this.dbms = dbms;
	}
	
	public MessageDao getMessageDao() {
		if ("oracle".equals(dbms)) {
			return oracleDao;
		} else if ("mysql".equals(dbms)) {
			return mysqlDao;
		} else if ("mssql".equals(dbms)) {
			return mssqlDao;
		}
		return null;
	}
}
