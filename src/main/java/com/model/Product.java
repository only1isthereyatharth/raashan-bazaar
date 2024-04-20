package com.model;

public class Product {
	private int product_id;
	private String category;
	private double price;
	private int quantity_available;
	private String product_image;
	private String product_name;
	public int getProductId() {
		return product_id;
	}
	public void setProductId(int product_id) {
		this.product_id = product_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity_available() {
		return quantity_available;
	}
	public void setQuantity_available(int quantity_available) {
		this.quantity_available = quantity_available;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Product(int product_id, String category, double price, int quantity_available, String product_image, String product_name) {
		this.product_id = product_id;
		this.category = category;
		this.price = price;
		this.quantity_available = quantity_available;
		this.product_image = product_image;
		this.product_name = product_name;
	}
	
	public Product() {}
}
