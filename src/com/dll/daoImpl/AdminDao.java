package com.dll.daoImpl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.dll.dao.IAdminDao;
import com.dll.entity.Admin;
import com.dll.util.JdbcUtils;
import com.dll.util.TxQueryRunner;

public class AdminDao implements IAdminDao{
	private static QueryRunner queryRunner=new TxQueryRunner();
	@Override
	public Admin findByName(String name) {
		String sql="select * from admin where name=?";
		try {
			return queryRunner.query(sql, new BeanHandler<Admin>(Admin.class),name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
