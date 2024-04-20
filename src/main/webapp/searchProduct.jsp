<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, com.model.*, com.Dao.*,com.Database.*,java.util.UUID" %>
<%
	@SuppressWarnings("unchecked")
	List<Product> list = (List<Product>)request.getSession().getAttribute("product-list");
	System.out.println(list);
	User auth = (User)request.getSession(true).getAttribute("auth");
	if (auth != null) {
	    request.getSession().setAttribute("auth", auth);
	    System.out.println(auth);
	}

	@SuppressWarnings("unchecked")
	List<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {	
		ProductDao pDao = new ProductDao(DbConnection.getConnection());
		cartProduct = pDao.getCartProduct(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("total", total);
		request.setAttribute("cart_list", cart_list);
	}
	
	// String sessionUUID = UUID.randomUUID().toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="card-header mt-3"><strong>All Products</strong></div>
		<div class="row">
			<%if(list!=null){ 
				for(Product product:list){
					%>
					<div class = "col-md-3">
					<div class="card " style="width: 18rem;">
					  <img class="card-img-top" src="images/<%= product.getProduct_image()%>" alt="Card image cap">
					  <div class="card-body">
					    <h5 class="card-title"><%= product.getProduct_name()%></h5>
					    <h6 class="price"><%=product.getPrice() %></h6>
					    <h6 class = "category"><%=product.getCategory() %></h6>
					    <div class = "mt-3 d-flex justify-content-between">
					    	<a href ="addItem?id=<%=product.getProductId() %>" class="btn btn-dark">Add to Cart</a>
					    	<a href ="order-now?quantity=1&id=<%=product.getProductId()%>" class="btn btn-primary">Buy Now</a>
					    </div><!-- addItem will send to Add_To_Cart servlet and orderNow will send to OrderNow servlet -->
					  </div>
				   	</div>
				</div> 
				<%}				
			}else{
			%>
			
			<h2>Sorry we could not find the product you were looking for☹️</h2>
			<%} %>
		</div>
	</div>
</body>
</html>