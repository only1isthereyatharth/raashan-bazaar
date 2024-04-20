<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Forgot Password</title>
<link rel="icon"
	href="images/shopping-cart_3900101.png" type = "image/x-icon">
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>

body {
	background-position: center;
	background-color: #eee;
	background-repeat: no-repeat;
	background-image: url("images/images.jpg");
	background-size: cover;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 15px;
	font-weight: normal;
	line-height: 1.0;
	text-transform: none;
	margin-top: 170px;
    margin-bottom: 100px;
  margin-right: 300px;
  margin-left: 300px;
}

.forgot {
	background-color: #fff;
	padding: 12px;
	border: 1px solid #dfdfdf
}

.padding-bottom-3x {
	padding-bottom: 72px !important
}

.card-footer {
	background-color: #fff
}

.btn {
	font-size: 15px
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745
}
</style>
</head>
<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
<body oncontextmenu='return false' class='snippet-body'>
	<div class="container padding-bottom-3x mb-2 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				
				<form class="card mt-4" action="forgotPassword" method="POST">
					<div class="card-body">
						<div class="form-group">
							<label for="email-for-pass"></label> <input
								class="form-control" type="text" name="email" id="email-for-pass" placeholder="Enter Email" required="required"><small
								class="form-text text-muted">Enter the registered email address</small>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-success" type="submit">Request OTP</button>
						&nbsp; &nbsp;<a href="login.jsp" class="form-group-link"><font color="blue">Back to Login </font></a>
						
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	<script type='text/javascript' src=''></script>
	<script type='text/javascript' src=''></script>
	<script type='text/Javascript'></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
  <script type="text/javascript">
  var status=document.getElementById("status").value;
  if(status=="failed"){
	  Swal.fire( {title: 'Sorry',
		  text: "This Email ID is not Registered",
		  icon: 'error',
		  showCancelButton: true,
		  confirmButtonColor: '#CCFFFF',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '<a href="login.jsp">Create Account</a> '})
	 }
 
  
  </script>
	
</body>
</html>