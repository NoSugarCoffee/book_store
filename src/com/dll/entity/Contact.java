package com.dll.entity;

public class Contact {
	private String name;
	private String email;
	private String phone;
	private String company;
	private String message;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Contact() {
		// TODO Auto-generated constructor stub
	}
	public Contact(String name, String email, String phone, String company,
			String message) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.company = company;
		this.message = message;
	}
	
}
