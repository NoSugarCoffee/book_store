package com.dll.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	private static ComboPooledDataSource comboPooledDataSource=new ComboPooledDataSource();
	private static ThreadLocal<Connection> threadLocal=new ThreadLocal<Connection>();
	//����ר��connection
	private static Connection connection=null;
	
	/*
	 * ��ȡ���ݿ����ӳص�һ������
	 */
	public static Connection getConnection() throws SQLException{
		//û�����񣬷������ӳص�����
		Connection connection = threadLocal.get();
		if(connection==null)
		return comboPooledDataSource.getConnection();
		return connection;
	}	
	/*
	 * ��������
	 */
	public static void beginTransation() throws SQLException{
		Connection connection = threadLocal.get();
		if(connection!=null){
			throw new SQLException("�����Ѿ������������ڿ���");
		}
		connection= comboPooledDataSource.getConnection();//�������� ��connection��ֵ
		threadLocal.set(connection);	
		connection.setAutoCommit(false);
	}
	/*
	 * �ύ����
	 * */
	public static void commitTransation() throws SQLException {
		Connection connection = threadLocal.get();
		if(connection==null){
			throw new SQLException("��δ�������񣬲����ύ");
		}
		connection.commit();
		connection.close();
		connection=null;
		threadLocal.remove();
	}
	/*
	 * �ع�����
	 * */
	public static void rollBackTransation() throws SQLException{
		Connection connection = threadLocal.get();
		if(connection==null){
			throw new SQLException("��δ�������񣬲����ύ");
		}
		connection.rollback();
		connection.close();
		connection=null;
		threadLocal.remove();
	}
	/*
	 *�ͷ����� 
	 * */
	public static void releaseConnection(Connection conn) throws SQLException{
		Connection connection = threadLocal.get();
		//��������
		if(conn!=connection){
			if(conn!=null && !conn.isClosed())
			conn.close();
		}
	} 
	
}
