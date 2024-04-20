<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.util.*, com.model.*, com.Database.*, com.Dao.*,java.text.DecimalFormat" %>
    
<%
	@SuppressWarnings("unchecked")
	ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
	List<Cart> cartList = null;
	List<Integer> cartListProductId = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DbConnection.getConnection());
		cartList = pDao.getCartProduct(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		//cartListProductId = pDao.getCartProductId(cart_list);
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total", total);
		//request.setAttribute("cart-list-product-id",cartListProductId);
	}
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User)request.getSession().getAttribute("auth");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body{
		text-align:center;
	}
	.incr-decrement-box{
		display:flex;
		justify-content:center;
	}
	
	
</style>
</head>
<body>
	<div class="container">
		<%if(cartList!=null && !cartList.isEmpty()){ %><div class="d-flex py-3"><h3>Total Price: $ ${(total>0)?dcf.format(total):0} </h3> 
		<a class="mx-3 btn btn-primary" href=<%=(auth==null)?"login.jsp":"AddressFiller.jsp"%>>Check Out</a>
		</div>
		
		<table class="table" style ="display:inline-table; table-layout: fixed;">
  			<thead class="table-info" >
				<tr>
					<th scope ="col">Name</th>
					<th scope ="col">Category</th>
					<th scope ="col">Price</th>
					<th scope ="col">Buy Now</th>
					<th scope ="col">Cancel</th>
				</tr>  
			</thead>
			<tbody>
			
			<%
			for(Cart c:cartList){ %><!-- Here we check if List is empty is empty -->
				<tr>
					<td><%= c.getProduct_name() %></td>
					<td><%= c.getCategory() %></td>
					<td>$<%= c.getPrice() %></td>
					<td>
						<div class = "incr-decrement-box">
							<a class = "btn btn-xl-btn-incre" href ="incr-decr?action=incr&id=<%= c.getId()%>"><i class = "fas fa-plus-square">+</i></a>
							<input class="form-control" type="text" name = "quantity" value = "<%=c.getProduct_quantity()%>" readonly style="width:22%">
							<a class = "btn btn-xl-btn-decre" href = "incr-decr?action=decr&id=<%= c.getId() %>"><i class = "fas fa-minus-square">-</i></a>	
						</div>
					</td>
					<td>
						<a class = "btn btn-sm btn-danger" href ="remove-item?id=<%= c.getId()%>">Remove</a>
					</td>
					
				</tr>
			<%} %>
			
			</tbody>
		</table>
		<%} else {%>
			<h2>Hey! Your Cart is empty.☹️</h2>
			<p>Please add some items in it.</p>
		<%} %>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" ></script>
</body>
</html>