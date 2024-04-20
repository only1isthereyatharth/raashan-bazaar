package com.model;

public class Cart extends Product{
	private int id;
	private int product_quantity;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public Cart(int id, int product_quantity) {
		this.id = id;
		this.product_quantity = product_quantity;
	}
	public Cart() {}
	
}
