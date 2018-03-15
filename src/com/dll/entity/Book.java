package com.dll.entity;

import java.util.Date;

public class Book {
	private int id;
	private String bookName;
	private double price;
	private String details;
	private String imgPath;
	private int type;
	private Date dateTime;
	private String author;
	private String publishing;
	private int storeNumber;
	private int salesAmount;
	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublishing() {
		return publishing;
	}
	public void setPublishing(String publishing) {
		this.publishing = publishing;
	}
	public int getStoreNumber() {
		return storeNumber;
	}
	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}
	public int getSalesAmount() {
		return salesAmount;
	}
	public void setSalesAmount(int salesAmount) {
		this.salesAmount = salesAmount;
	}
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Book() {
	
	}
	
	public Book(int id, String bookName, double price, String details,
			String imgPath, int type, Date dateTime, int promotions,
			String author, String publishing, int storeNumber, int salesAmount) {
		this.id = id;
		this.bookName = bookName;
		this.price = price;
		this.details = details;
		this.imgPath = imgPath;
		this.type = type;
		this.dateTime = dateTime;
		this.author = author;
		this.publishing = publishing;
		this.storeNumber = storeNumber;
		this.salesAmount = salesAmount;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", bookName=" + bookName + ", price=" + price
				+ ", details=" + details + ", imgPath=" + imgPath + ", type="
				+ type + ", dateTime=" + dateTime + ", promotions="
				+ ", author=" + author + ", publishing="
				+ publishing + ", storeNumber=" + storeNumber
				+ ", salesAmount=" + salesAmount + "]";
	}
	
}
