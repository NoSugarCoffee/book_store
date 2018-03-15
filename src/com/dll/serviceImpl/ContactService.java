package com.dll.serviceImpl;

import com.dll.dao.IContactDao;
import com.dll.entity.Contact;
import com.dll.factory.BeanFactory;
import com.dll.service.IContactService;

public class ContactService implements IContactService{
	private IContactDao contactDao=(IContactDao)BeanFactory.getInstance("ContactDao");
	@Override
	public void save(Contact contact) {
		// TODO Auto-generated method stub
		contactDao.save(contact);
	}

}
