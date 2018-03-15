package com.dll.daoImpl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.dll.dao.IContactDao;
import com.dll.entity.Contact;
import com.dll.util.JdbcUtils;
import com.dll.util.TxQueryRunner;

public class ContactDao implements IContactDao{
	private static QueryRunner queryRunner=new TxQueryRunner();
	@Override
	public void save(Contact contact) {
		// TODO Auto-generated method stub
		String sql="insert into contact(name,email,phone,company,message) values(?,?,?,?,?)";
		try {
			queryRunner.update(sql,contact.getName(),contact.getEmail(),contact.getPhone(),contact.getCompany(),contact.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("contact save() error");
		}
	}

}
