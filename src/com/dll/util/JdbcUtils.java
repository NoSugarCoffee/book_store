package com.dll.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	private static ComboPooledDataSource comboPooledDataSource=new ComboPooledDataSource();
	private static ThreadLocal<Connection> threadLocal=new ThreadLocal<Connection>();
	//事物专用connection
	private static Connection connection=null;
	
	/*
	 * 获取数据库连接池的一个连接
	 */
	public static Connection getConnection() throws SQLException{
		//没有事务，返回连接池的连接
		Connection connection = threadLocal.get();
		if(connection==null)
		return comboPooledDataSource.getConnection();
		return connection;
	}	
	/*
	 * 开启事务
	 */
	public static void beginTransation() throws SQLException{
		Connection connection = threadLocal.get();
		if(connection!=null){
			throw new SQLException("事务已经开启，不能在开启");
		}
		connection= comboPooledDataSource.getConnection();//开启事物 给connection赋值
		threadLocal.set(connection);	
		connection.setAutoCommit(false);
	}
	/*
	 * 提交事务
	 * */
	public static void commitTransation() throws SQLException {
		Connection connection = threadLocal.get();
		if(connection==null){
			throw new SQLException("还未开启事务，不能提交");
		}
		connection.commit();
		connection.close();
		connection=null;
		threadLocal.remove();
	}
	/*
	 * 回滚事务
	 * */
	public static void rollBackTransation() throws SQLException{
		Connection connection = threadLocal.get();
		if(connection==null){
			throw new SQLException("还未开启事务，不能提交");
		}
		connection.rollback();
		connection.close();
		connection=null;
		threadLocal.remove();
	}
	/*
	 *释放连接 
	 * */
	public static void releaseConnection(Connection conn) throws SQLException{
		Connection connection = threadLocal.get();
		//不是事物
		if(conn!=connection){
			if(conn!=null && !conn.isClosed())
			conn.close();
		}
	} 
	
}
