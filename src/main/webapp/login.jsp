<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RaashanBazaar</title>
    <link rel="icon"
	href="image/favicons.jpg" type = "image/x-icon">
    <link rel="stylesheet" href="css/login.css">
   <link rel="stylesheet"
          href= https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css >
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>
  <input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
    <section class="container">
        <img class="myphoto"src="image/signin2.jpg" alt="my">
        <article class="half">
              <h1>Raashan Bazaar</h1>
              <div class="tabs">
                <span class="tab signin active"><a href="#signin">Sign in</a></span>
                <span class="tab signup"><a href="#signup">Sign up</a></span>  
              </div>
              <div class="content">
                    <div class="signin-cont cont">
                          <form method="post" action="regir">
                               <div class="input-icons">
                               <i class="fa fa-envelope icon"></i>
                                <label for="email"></label>
                                 <input type="email" name="email" id="email"  class="inpt" placeholder=" Email" required="required" /></div>
                                <div class="input-icons"><label for="password"> password</label>
                                <i class="fa fa-key icon"></i>
                                <input type="password" name="password" id="password" class="inpt" placeholder=" Password" required="required" /></div>
                               
                                <div><input type="checkbox" id="remember" class="checkbox" checked>
                                <label for="remember">Remember me</label>
                                
                                <font size="2" ><a style="text-decoration: none;"href="forgotPassword.jsp" ><font color="blue" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Forgot Password </font></a></font></div>
<br><br>
                                <div class="jagrati">
                                      <input type="submit" value="Sign in" class="submit">
                                </div>
                                <br>
                                
                                <p class="temp">or connect with</p>
                                <div class="social-media">
                                <a href="https://accounts.google.com/v3/signin/identifier?hl=en-GB&ifkv=AYZoVhdxm63xhqMO4vJp-JdrAc4mIn6BxPYNrJPKaqAX1YxZikKHjbbDEuZJzPDyVYBE_SSLt3Uhjw&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S50972266%3A1694894136963143&theme=glif"><img src="icons/google1.png" alt="Google"></a>
                                <a href="https://www.facebook.com/login/"><img src="icons/facebook.png" alt="fb"></a>
                                <a href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D"><img src="icons/twitter1.png" alt="fb">  </a>
                                <a href="https://in.linkedin.com/?src=go-pa&trk=sem-ga_campid.14650114788_asid.151761418307_crid.657403558721_kw.linkedin%20login_d.c_tid.kwd-12704335873_n.g_mt.e_geo.1007786&mcid=6844056167778418689&cid=&gclid=EAIaIQobChMIg4uw0_WvgQMVxLCWCh2Ijge8EAAYASAAEgJK_vD_BwE&gclsrc=aw.ds"><img src="icons/linkedln1.png" alt="linkedln"></a>
                                </div>
                          </form>
                    </div>
                    <div class="signup-cont cont">
                <form method="post" action="register">
                                <div class="input-icons"><label for="name"></label>
                                <i class="fa fa-user icon"></i>
                                <input type="text" name="name" id="name" class="inpt"  placeholder="Name" required="required"/></div>
                                <div class="input-icons"> 
                                <label for="email"></label>
                                <i class="fa fa-envelope icon"></i>
                          <input type="email" name="email" id="email" class="inpt"  placeholder=" Email" required="required"/>
                          </div>
                                
                                <div class="input-icons">
                                    <label for="phone"></label>
                                    <i class="fa fa-phone icon"></i>
                                    <input type="tel" name="contact" id="phone"  pattern="[1-9]{1}[0-9]{9}"  class="inpt"
                                         placeholder="Phone number" required="required" title="Phone no. should only contain digits and not more than 10 digits"/>
                                </div>
                                <div class="input-icons" >
                                <label for="pass"></label>
                                <i class="fa fa-key icon"></i>
                                <input type="password" name="pass" minlength="8" id="pass" class="inpt" placeholder=" Password" required="required"  />
                                </div>
                                <div class="input-icons" >
                                <label for="re-pass"></label>
                                <i class="fa fa-key icon"></i>
                                <input type="password" name="re_pass" id="re_pass" class="inpt"  placeholder=" Confirm Password" required="required" />
                                </div>
                               
                               <p><font size="2" ><input type="checkbox" name="agree-term" id="agree-term" checked/>I Agree to the <a style="text-decoration: none;" href="terms.jsp"><font color="blue" >Terms and Conditions</font></a></font></p>
                                   
                                    <div class="submit-wrap">
                                       <input type="submit"  value="Sign up" class="submit">
                                      </div>
                          </form>
                    
            </div>
              </div>
        </article>
        <div class="half bg"></div>
  </section>
  <script>
    $('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
  </script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
  <script type="text/javascript">
  var status=document.getElementById("status").value;
  if(status=="success"){
	Swal.fire( {title: 'Congrats',
			  text: "Account created successfully",
			  icon: 'success',
			  confirmButtonColor: '#008000',
			  confirmButtonText: 'ok'})
	 
  }
  if(status=="failed"){
		Swal.fire( 'Sorry!','Wrong Username or Password!','error')
		 }
   if(status=="invalidName"){
		Swal.fire( 'Sorry!','Please Enter Name!','error')
		 }
if(status=="invalidEmail"){
		Swal.fire( 'Sorry!','Please Enter Email!','error')
		 }
 if(status=="invalidUpwd"){
	Swal.fire( 'Sorry!','Please Enter Password!','error')
	 }
 if(status=="invalidConfirmp"){
	Swal.fire( 'Sorry!','Password do not match!','error')
	 }
 if(status=="invalidMobile"){
	Swal.fire( 'Sorry!','Please Enter Phone Number!','error')
	 }
 if(status=="resetSuccess"){
		Swal.fire( 'Congrats!','Password Reset Successful','success')
		 }
 if(status=="resetFailed"){
		Swal.fire( 'Sorry!','Password Reset Fail!','error')
		 }
 </script>
</body>
</html>