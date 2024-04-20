package com.Dao;

import java.util.List;
import java.util.Set;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

import com.Database.DbConnection;
import com.model.*;

public class ProductDao {
	private PreparedStatement psmt;
	private Connection con;
	private ResultSet rs;
	
	public ProductDao(Connection con) throws ClassNotFoundException, SQLException{
		this.con = con;
	}
	public List<Product> getAllProduct() throws SQLException{
		List<Product> list = new ArrayList<>();
		String query = "select * from `shoppingcart`.`products";
		
		try {
			query ="SELECT * FROM rashanbazar.products;";
			psmt  =  DbConnection.getConnection().prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Product row = new Product();
				row.setProductId(rs.getInt(1));
				row.setCategory(rs.getString(2));
				row.setPrice(rs.getDouble(3));
				row.setProduct_name(rs.getString(4));
				row.setQuantity_available(rs.getInt(5));
				row.setProduct_image(rs.getString(6));
				list.add(row);
//				System.out.println("Row is added");
			}
		}
		catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
	public List<Product> getProductByCategory(String category) throws ClassNotFoundException, SQLException{
		List<Product> cart = new ArrayList<>();
		String query = "select * from rashanbazar.products where product_category=?";
		psmt = this.con.prepareStatement(query);
		psmt.setString(1, category);
		rs = psmt.executeQuery();
		while(rs.next()) {
			Product row = new Product();
			row.setProductId(rs.getInt(1));
			row.setCategory(rs.getString(2));
			row.setPrice(rs.getDouble(3));
			row.setProduct_name(rs.getString(4));
			row.setQuantity_available(rs.getInt(5));
			row.setProduct_image(rs.getString(6));
			cart.add(row);
		}
		return cart;
	} 	
	
	public Set<Product> getWishListProduct(Set<Product> wishList) throws SQLException{
		Set<Product> newWishList = new HashSet<>();
		for(Product c:wishList) {
			String query = "select * from rashanbazar.products where product_id=?";
			psmt = this.con.prepareStatement(query);
			psmt.setObject(1, c.getProductId());
			rs = psmt.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setProductId(rs.getInt(1));
				row.setCategory(rs.getString(2));
				row.setPrice(rs.getDouble(3));
				row.setProduct_name(rs.getString(4));
				row.setQuantity_available(rs.getInt(5));
				row.setProduct_image(rs.getString(6));
				newWishList.add(row);
			}
		}
		return newWishList;
	}
	
	public List<Cart> getCartProduct(List<Cart> cartList) throws SQLException{
		List<Cart> newCartList = new ArrayList<>();
		for(Cart c:cartList) {
			String query = "select * from rashanbazar.products where product_id=?";
			psmt = this.con.prepareStatement(query);
			psmt.setObject(1, c.getId());
			rs = psmt.executeQuery();
			while(rs.next()) {
				Cart row = new Cart();
				row.setId(rs.getInt("product_id"));
				row.setCategory(rs.getString("product_category"));
				row.setProduct_name(rs.getString("product_name"));
				row.setPrice(rs.getDouble("product_price")*c.getProduct_quantity());
				row.setProduct_quantity(c.getProduct_quantity());
				newCartList.add(row);
			}
		}
		return newCartList;
	}
	
	public List<Product> getSearchProduct(String searchWord) throws SQLException, ClassNotFoundException{
		List<Product> product_list = new ArrayList<>();
		searchWord="%"+searchWord+"%";
		System.out.println("We are in getSearchProduct Method of class ProductDao");
		String query = "SELECT * FROM rashanbazar.products WHERE (product_category LIKE ? OR product_name LIKE ?);";
		psmt = this.con.prepareStatement(query);
		psmt.setString(1, searchWord);
		psmt.setString(2, searchWord);
		rs = psmt.executeQuery();

		rs = psmt.executeQuery();
		
		while(rs.next()) {
			Product row = new Product();
			row.setProductId(rs.getInt(1));
			row.setCategory(rs.getString(2));
			row.setPrice(rs.getDouble(3));
			row.setProduct_name(rs.getString(4));
			row.setQuantity_available(rs.getInt(5));
			row.setProduct_image(rs.getString(6));
			product_list.add(row);
		}
		System.out.println(product_list);
		return product_list;
	}
	
	public List<Integer> getCartProductId(List<Cart> cartList){
		List<Integer> newCartListId = new ArrayList<>();
		
		for(Cart c:cartList) {
			newCartListId.add(c.getId());
		}
		return newCartListId;
	}
	
	public double getTotalCartPrice(List<Cart> cartList) throws SQLException {
		double total = 0.0;
		if(cartList!=null) {
			for(Cart c:cartList) {
				String query ="select product_price from rashanbazar.products where product_id=?";
				psmt = con.prepareStatement(query);
				psmt.setObject(1,c.getId());
				rs = psmt.executeQuery();
				while(rs.next()) {
					total+=rs.getDouble("product_price")*c.getProduct_quantity();
				}
			}
		}
		return total;
	}
	

	 public Product getSingleProduct(int id) {
		 Product row = null;
	        try {
	            String query = "select * from rashanbazar.products where product_id=? ";

	            psmt = this.con.prepareStatement(query);
	            psmt.setInt(1, id);
	            rs = psmt.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	            	row.setQuantity_available(rs.getInt("product_quantity_available"));
	                row.setProductId(rs.getInt("product_id"));
	                row.setProduct_name(rs.getString("product_name"));
	                row.setCategory(rs.getString("product_category"));
	                row.setPrice(rs.getDouble("product_price"));
	                row.setProduct_image(rs.getString("product_image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
	
	
}
