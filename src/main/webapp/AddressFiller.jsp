	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.util.*, com.model.*, com.Database.*, com.Dao.*" %>
<%
   	User auth = (User)request.getSession().getAttribute("auth");
    if(auth!=null){
   	 request.setAttribute("auth",auth);
    }
    @SuppressWarnings("unchecked")
   	ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
    if(cart_list!=null){
    	request.setAttribute("cart_list",cart_list);
    }
	    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "SupportedFiles/header.jsp" %>
</head>
<body>
	
	<div class ="container d-flex justify-content-center">
		<div class = "card w-50 mx-atuo my-5">
			<div class = "card-header text-center">Fill Address</div>
			<div class = "card-body">
		<form method="post" action="check-out">
		  <div class="mb-3">
		    <label for="exampleInputName" class="form-label">Receiver's Name</label>
		    <input type="text" class="form-control" name="user-name">
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputAddress" class="form-label">Shipping Address</label>
		    <input type="text" class="form-control" name="user-address">
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPinCode" class="form-label">Pin Code</label>
		    <input type="Number" class="form-control" name="user-pin-code">
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputEmail" class="form-label">Email address</label>
		    <input type="email" class="form-control" name="user-email" aria-describedby="emailHelp">
		    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword" class="form-label">Contact Number</label>
		    <input type="text" class="form-control" name="user-contact" placeholder="+91">
		  </div>
		  	<button type="submit" class="btn btn-primary">Submit</button>
		  	
	</form>
	</div>
	</div>	
	</div>
	
	<%@include file = "SupportedFiles/footer.jsp" %>
</body>
</html>