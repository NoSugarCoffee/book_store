package com.dll.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.dll.daoImpl.ContactDao;
import com.dll.entity.Contact;

public class ContactDaoTest {

	@Test
	public void test() {
		ContactDao contactDao=new ContactDao();
		Contact contact=new Contact();
		contact.setName("dll");
		contact.setCompany("�Ͼ���ׯѧԺ");
		contact.setEmail("1353025854@qq.com");
		contact.setPhone("111111");
		contact.setMessage("����ĳĳĳ������֮��ϵͳ���ֹ��ϣ��ἰʱ�޸�");
		
		contactDao.save(contact);
	}

}
