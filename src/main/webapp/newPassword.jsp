<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Reset password</title>
<link rel="icon"
	href="images/shopping-cart_3900101.png" type = "image/x-icon">
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
	
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
.placeicon {
	font-family: fontawesome
}

.custom-control-label::before {
	background-color: #dee2e6;
	border: #dee2e6
}
</style>
</head>
<body oncontextmenu='return false' class='snippet-body bg-info'>
<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
		<div>
		<!-- Container containing all contents -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
					<!-- White Container -->
					<div class="container bg-white rounded mt-2 mb-2 px-0">
						<!-- Main Heading -->
						<div class="row justify-content-center align-items-center pt-3">
							<h1>
								<strong>Reset Password</strong>
							</h1>
						</div>
						<div class="pt-3 pb-3">
							<form class="form-horizontal" action="newPassword" method="POST">
								<!-- User Name Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="text" name="password" placeholder="&#xf084; &nbsp;Enter New Password"
											class="form-control border-info placeicon">
									</div>
								</div>
								<!-- Password Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="password" name="confPassword"
											placeholder="&#xf084; &nbsp; Confirm New Password"
											class="form-control border-info placeicon">
									</div>
								</div>
								<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><font color="blue">Retrieve Password</font></a></div>
								<!-- Log in Button -->
								<div class="form-group row justify-content-center">
									<div class="col-3 px-3 mt-3">
										<input type="submit" value="Reset"
											class="btn btn-block btn-info">
                                                         
									</div>
				                                 
								</div>
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
		 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
  <script type="text/javascript">
  var status=document.getElementById("status").value;
 if(status=="invalidConfirm"){
	Swal.fire( 'Sorry!','Password do not match!','error')
	 }
 
  
  </script>
	
</body>
</html>