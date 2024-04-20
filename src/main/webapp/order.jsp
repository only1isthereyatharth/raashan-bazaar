<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.*,java.text.DecimalFormat, com.Dao.*, com.Database.*" %>
<%
	@SuppressWarnings("unchecked")
	ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
	if(cart_list!=null){
		request.setAttribute("cart_list",cart_list);
	}
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("auth", auth);
	    OrderDao orderDao  = new OrderDao(DbConnection.getConnection());
		orders = orderDao.userOrders(auth.getUser_id());
	}else{
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<%@ include file = "SupportedFiles/header.jsp" %>
</head>

<body>	
	<script>
       	let cancelOrderFunc = function(getId){
       		if(window.confirm("Do you want to cancel your order?")){window.location.href = "cancel-order?id="+getId;}}
	  </script>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getProduct_name() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<%if(o.getStatus().equals("Placed")){ %>
						<td><button class="btn btn-sm btn-danger" onclick="cancelOrderFunc(<%= o.getOrderId() %>)">Cancel Order</button></td>
						<%}else{ %>
						<td>Canceled</td>
						<%} %>
        			</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	<%@include file = "SupportedFiles/footer.jsp" %>
</body>
</html>