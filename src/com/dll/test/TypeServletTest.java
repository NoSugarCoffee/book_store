package com.dll.test;

import java.util.List;

import org.junit.Test;

import com.dll.entity.Type;
import com.dll.serviceImpl.TypeService;

public class TypeServletTest {
	@Test
	public void test(){
		TypeService typeService=new TypeService();
		boolean save = typeService.save("ÊýÑ§Àà");
		System.out.println(save);
	}
}
