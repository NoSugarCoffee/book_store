package com.dll.util;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

/*
 * 支持事务  （如何使用代理实现？？？？）
 */
public class TxQueryRunner extends QueryRunner{

	 @Override  
	    public int[] batch(String sql, Object[][] params)  
	            throws SQLException {  
	        Connection conn = JdbcUtils.getConnection();  
	        int[] result = super.batch(conn, sql, params);  
	        JdbcUtils.releaseConnection(conn);  
	        return result;  
	    }  
	  
	    @Override  
	    public <T> T query(String sql, ResultSetHandler<T> rsh,  
	            Object... params) throws SQLException {  
	        Connection conn = JdbcUtils.getConnection();  
	        T result =  super.query(conn, sql, rsh, params);  
	        JdbcUtils.releaseConnection(conn);  
	        return result;  
	    }  
	  
	    @Override  
	    public <T> T query(String sql, ResultSetHandler<T> rsh)  
	            throws SQLException {  
	        Connection conn = JdbcUtils.getConnection();  
	        T result =  super.query(conn, sql, rsh);  
	        JdbcUtils.releaseConnection(conn);  
	        return result;  
	    }  
	  
	    @Override  
	    public int update(String sql, Object... params)  
	            throws SQLException {  
	        Connection conn = JdbcUtils.getConnection();  
	        int result = super.update(conn, sql, params);  
	        JdbcUtils.releaseConnection(conn);  
	        return result;  
	    }  
	  
	    @Override  
	    public int update(String sql, Object param)  
	            throws SQLException {  
	        Connection conn = JdbcUtils.getConnection();  
	        int result =  super.update(conn, sql, param);  
	        JdbcUtils.releaseConnection(conn);  
	        return result;  
	    }  
	  
	    @Override  
	    public int update(String sql) throws SQLException {  
	        Connection conn = JdbcUtils.getConnection();  
	        int result =  super.update(conn, sql);  
	        JdbcUtils.releaseConnection(conn);  
	        return result;  
	    }
		@Override
		public <T> T insert(String sql, ResultSetHandler<T> rsh)
				throws SQLException {
			// TODO Auto-generated method stub
			Connection conn = JdbcUtils.getConnection();
			T result=super.insert(conn,sql, rsh);
			JdbcUtils.releaseConnection(conn);  
			return result;
		}

		@Override
		public <T> T insert(String sql, ResultSetHandler<T> rsh,
				Object... params) throws SQLException {
			// TODO Auto-generated method stub
			Connection conn = JdbcUtils.getConnection();
			T result=super.insert(conn,sql, rsh, params);
			JdbcUtils.releaseConnection(conn);  
			return result;
		}

		@Override
		public <T> T insertBatch(String sql, ResultSetHandler<T> rsh,
				Object[][] params) throws SQLException {
			// TODO Auto-generated method stub
			Connection conn = JdbcUtils.getConnection();
			T result=super.insertBatch(conn,sql, rsh, params);
			JdbcUtils.releaseConnection(conn);  
			return result; 
		}  
}

