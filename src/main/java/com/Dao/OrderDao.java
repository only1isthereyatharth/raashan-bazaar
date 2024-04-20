package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Database.DbConnection;
import com.model.Order;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pstm;
	public boolean insertOrders(Order order) throws ClassNotFoundException, SQLException {
		
		query = "insert into rashanbazar.orders (product_id,customer_id, order_quantity, order_date, order_status) values(?,?,?,?,?)";
		PreparedStatement pstm = this.con.prepareStatement(query);
		pstm.setObject(1,order.getProductId());
		pstm.setObject(2,order.getUid());
		pstm.setObject(3, order.getQunatity());
		pstm.setObject(4, order.getDate());
		pstm.setObject(5, "Placed");
		int i = pstm.executeUpdate();
		return i>0;
		
	}
	
//	public boolean updateQuantityAvaiable(Product product, int product_id, Order order, boolean incr) throws SQLException {
//		
//		String query = "UPDATE `shoppingcart`.`products` SET `product_quantity_available`=? WHERE  `product_id`=?";
//		pstm = con.prepareStatement(query);
//		int quantity = ((incr)?1:-1)*order.getQunatity() ;
//		pstm.setObject(1,product.getQuantity_available()+quantity);
//		pstm.setObject(2,product_id);
//		return pstm.executeUpdate()>0;
//	}
	
	
	public void cancelOrder(int id) throws ClassNotFoundException {
		//boolean result = false;
		try {
			query = "UPDATE rashanbazar.orders SET `order_status`='Canceled' WHERE  `order_id`=?;";
			pstm = this.con.prepareStatement(query);
			pstm.setInt(1, id);
			pstm.executeUpdate();
			//result = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		//return result;
	}
	
	
	public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from rashanbazar.orders where customer_id=? order by orders.order_id desc";
            if(con==null)con=DbConnection.getConnection();
            pstm = this.con.prepareStatement(query);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("product_id");
                com.model.Product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("order_id"));
                order.setProductId(pId);
                order.setProduct_name(product.getProduct_name());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("order_quantity"));
                order.setQunatity(rs.getInt("order_quantity"));
                order.setDate(rs.getString("order_date"));
                order.setStatus(rs.getString("order_status"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    
    
    
	public OrderDao(Connection con) throws ClassNotFoundException, SQLException {
		this.con = con;
	}
}
