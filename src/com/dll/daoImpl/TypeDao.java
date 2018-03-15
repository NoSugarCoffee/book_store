package com.dll.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import com.dll.dao.ITypeDao;
import com.dll.entity.Type;
import com.dll.util.TxQueryRunner;

public class TypeDao implements ITypeDao{
	private static QueryRunner queryRunner=new TxQueryRunner();
	@Override
	public List<Type> getAll() {
		String sql="select * from type";
		try {
			return	queryRunner.query(sql, new BeanListHandler<Type>(Type.class));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public  int save(String typeName) {
		String sql="insert into type(typeName) values(?)";
		try {
			return queryRunner.update(sql, typeName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public int update(String typeName,int id){
		String sql="update type set typeName=? where id=?";
		try {
			return queryRunner.update(sql,typeName,id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteById(int id){
		String sql="delete from type where id=?";
		try {
			return queryRunner.update(sql,id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
}
