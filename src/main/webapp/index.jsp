<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.model.*, com.Dao.*, java.util.*, com.Database.*" %>


<%if(session.getAttribute("name")==null){
	response.sendRedirect("login.jsp");
  } 


	/*String category = request.getParameter("category");
	ProductDao pdo = new ProductDao(DbConnection.getConnection());
	request.getSession().setAttribute("category",category);
	List<Product> product_list = pdo.getProductByCategory((category==null)?"Fruits":category);
	
	@SuppressWarnings("unchecked")
	List<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {	
		cartProduct = pdo.getCartProduct(cart_list);
		double total = pdo.getTotalCartPrice(cart_list);
		request.setAttribute("total", total);
		request.setAttribute("cart_list", cart_list);
	}
	@SuppressWarnings("unchecked")
	List<Product> wishList = (ArrayList<Product>)request.getSession().getAttribute("wish-list");
	List<Product> wish_list=null;
	if(wishList!=null){
		wish_list = pdo.getWishListProduct(wishList);
		request.setAttribute("wish_list", wishList);
	}*/
%>
 <!doctype html-->
 <html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--==Title==================================-->
    <title>Raashan Bazaar</title>
    <link rel="icon" href="image/favicons.jpg"/>
    <!--==Stylesheet=============================-->
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <!--==Fav-icon===============================-->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://use.fontawesome.com/0206006232.js"></script>
  
    <!--==Using-Font-Awesome=====================-->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <!--==Import-Font-Family======================-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
      <script>
      $(document).ready(function(){
    	  $("#heart").click(function(){
    	    if($("#heart").hasClass("liked")){
    	      $("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
    	      $("#heart").removeClass("liked");
    	    }else{
    	      $("#heart").html('<i class="far fa-heart" aria-hidden="true"></i>');
    	      $("#heart").addClass("liked");
    	    }
    	  });
    	});
  </script>
        <!--==Navigation================================-->
        <nav class="navigation">
            <!--logo-------->
            <a href="index.jsp" class="logo">
                <span>Raashan</span>Bazaar
            </a>
            <!--menu-btn---->
            <input type="checkbox" class="menu-btn" id="menu-btn">
            <label for="menu-btn" class="menu-icon">
                <span class="nav-icon"></span>
            </label>
            <!--menu-------->
            <ul class="menu">
                <li><a href="index.jsp" >Home</a></li>
                <li><a href="#category">Categories</a></li>
                <li><a href="#popular-bundle-pack">Our Packages</a></li>
                <li><a href="#download-app">About Us</a></li>
                <li><a href="login.jsp">Log Out</a></li>
            </ul>
            <!--right-nav-(cart-like)-->
            <div class="right-nav">
                <!--like----->
                <a href="wishlist.jsp" class="like">
                    <i class="far fa-heart"></i>
                    <span>${(wish_list==null)?0:wish_list.size()}</span>
                </a>
                <!--cart----->
                <a href="cart.jsp" class="cart">
                    <i class="fas fa-shopping-cart"></i>
                    <span>${(cart_list==null)?0:cart_list.size()}</span>
                </a>
            </div>
        </nav>
        <!--nav-end--------------------->
        <!--==Search-banner=======================================-->
        <section id="search-banner">
            <!--bg--------->
            <img src="images/Background.jpeg" class="bg-1" alt="bg">
            <img src="images/bg-2.png" class="bg-2" alt="bg-2">
            <!--text------->
            <div class="search-banner-text">
                <h1>Order Your daily Groceries</h1>
                <strong>#Free Delivery</strong>
                <!--search-box------>
                <form method="post" action="search-category" class="search-box">
                    <!--icon------>
                    <i class="fas fa-search"></i>
                    <!--input----->
                    <input type="text" class="search-input" placeholder="Search your daily groceries" name="search" required>
                    <!--btn------->
                    <button type="submit" class="search-btn" value="Search">Search</button>
                </form>
            </div>
        </section>
        <!--search-banner-end--------------->
        <!--==category=========================================-->
        <section id="category">
            <!--heading---------------->
            <div class="category-heading">
                <h2>Category</h2>
                <!-- <span>All</span> -->
            </div>
            <!--box-container---------->
            <div class="category-container">
                <!--box---------------->
                <!-- <a href="#" class="category-box">
                    <img src="images/fish.png" alt="Fish">
                    <span>Fish & Meat</span>
                </a> -->
                <!--box---------------->
                <a href="index.jsp?category=Vegetables" class="category-box">
                    <img src="images/Vegetables.png" alt="Vegatables-logo">
                    <span>Vegetables</span>
                </a>
                <!--box---------------->
                <a href="index.jsp?category=Fruits" class="category-box">
                    <img src="images/medicine.png" alt="Fruits-Logo">
                    <span>Fruits</span>
                </a>
                <!--box---------------->
                <a href="index.jsp?category=Baby-Care" class="category-box">
                    <img src="images/baby.png" alt="Baby-Care-Logo">
                    <span>Baby Care</span>
                </a>
                <!--box---------------->
                <a href="index.jsp?category=Frozen-Food" class="category-box">
                    <img src="images/office.png" alt="Frozen-Food-Logo">
                    <span>Frozen Foods</span>
                </a>
                <!--box---------------->
                <a href="index.jsp?category=Beauty" class="category-box">
                    <img src="images/beauty.jpg" alt="Beauti-Logo">
                    <span>Beauty</span>
                </a>
                <!--box---------------->
                <a href="index.jsp?category=Daily-Essentials" class="category-box">
                    <img src="images/Gardening.png" alt="Daily-Essantials-Logo">
                    <span>Daily Essentials</span>
                </a>
            </div>
            
        </section>
        <!--category-end----------------------------------->
        <!--==Products====================================-->
        <section id="popular-product">
            <!--heading----------->
            <div class="product-heading">
                <h3>${(category==null)?"Popular Products":category}</h3>
                <!-- <span>All</span> -->
            </div>
            <!--box-container------>
            
            
            <!-- Idhar for loop lagana hai -->
            <div class="product-container">
          
            </div>
                <!--box---------->
                <%--
                <div class="product-box">
                    <img src="images/chili.png" alt="apple">
                    <strong>Chili</strong>
                    <span class="quantity">1 KG</span>
                    <span class="price">Rs.30</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                  
                </div>
                <!--box---------->
                <div class="product-box">
                    <img src="images/onion.png" alt="apple">
                    <strong>Onion</strong>
                    <span class="quantity">1 KG</span>
                    <span class="price">Rs.35</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
                <!--box---------->
                <div class="product-box">
                    <img src="images/patato.png" alt="apple">
                    <strong>Potato</strong>
                    <span class="quantity">1 KG</span>
                    <span class="price">Rs.40</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
                <!--box---------->
                <div class="product-box">
                    <img src="images/garlic.png" alt="apple">
                    <strong>Garlic</strong>
                    <span class="quantity">1 KG</span>
                    <span class="price">Rs.50</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
                <!--box---------->
                <div class="product-box">
                    <img src="images/tamato.png" alt="apple">
                    <strong>Tomato</strong>
                    <span class="quantity">1 KG</span>
                    <span class="price">Rs.30</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
            </div>	
                 --%>
                
                
                
        </section>
        <!--popular-product-end--------------------->
        <!--Popular-bundle-pack===================================-->
        
        <%-- 
        <section id="popular-bundle-pack">
            <!--heading-------------->
            <div class="product-heading">
                <h3>Popular Bundle Pack</h3>
            </div>
            <!--box-container------>
            <div class="product-container">
                <!--box---------->
                <div class="product-box">
                    <img src="images/pack1.png" alt="pack">
                    <strong>Multi-Use Pack</strong>
                    <span class="quantity">Oil,Tomato,Potato,+2</span>
                    <span class="price">Rs.500</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                   <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
                <!--box---------->
                <div class="product-box">
                    <img src="images/pack2.jpg" alt="apple">
                    <strong>Big Pack</strong>
                    <span class="quantity">Lemon,Tomato,Brocolli,+2</span>
                    <span class="price">Rs.700</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
                <!--box---------->
                <div class="product-box">
                    <img src="images/pack3.png" alt="apple">
                    <strong>Small Pack</strong>
                    <span class="quantity">Tomato, Coriander, Garlic</span>
                    <span class="price">Rs.200</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
                <!--box---------->
                <div class="product-box">
                    <img src="images/pack1.png" alt="pack">
                    <strong>Fruits Basket</strong>
                    <span class="quantity">Kiwi, Apple, Mango,+4</span>
                    <span class="price">Rs.400</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
                <!--box---------->
                <div class="product-box">
                    <img src="images/Dryfruits.jpg" alt="apple">
                    <strong>Dryfruits Combo</strong>
                    <span class="quantity">Almonds,Cashew Nuts, Pistachios,+2</span>
                    <span class="price">Rs.350</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
                <!--box---------->
                <div class="product-box">
                    <img src="images/Snacks.png" alt="apple">
                    <strong>Snacks combo</strong>
                    <span class="quantity">Chips, Choclates, SoftDrinks,+4</span>
                    <span class="price">Rs.150</span>
                    <!--cart-btn------->
                    <a href="#" class="cart-btn">
                        <i class="fas fa-shopping-bag"></i> Add Cart
                    </a>
                    <!--like-btn------->
                    <span id =heart class="like-btn">
                        <i class="far fa-heart" aria-hidden="true"></i>
                    </span>
                </div>
            </div>
        </section>
        --%>
        
        
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" ></script>
        <!--popular-bundle-pack-end-------------------------------->
        <!--==Clients===============================================-->
        <section id="clients">
            <!--heading---------------->
            <div class="client-heading">
                <h3>What Our Client's Say</h3>
            </div>
            <!--box-container---------->
            <div class="client-box-container">
                <!--box------------->
                <div class="client-box">
                    <!--==profile===-->
                    <div class="client-profile">
                        <!--img--->
                        <img src="images/client-1.jpg" alt="client">
                        <!--text-->
                        <div class="profile-text">
                            <strong>James Mcavoy</strong>
                            <span>CEO</span>
                        </div>
                    </div>
                    <!--==Rating======-->
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <!--==comments===-->
                    <p>Perfect online grocery store for after work grocery shopping. Our family loves shopping with Raashan Bazaar. I can guarantee that you will surely get a much better grocery shopping experience here than anywhere else. Thanks again I have a great experience shopping with you guys each time </p>
                </div>
                <!--box------------->
                <div class="client-box">
                    <!--==profile===-->
                    <div class="client-profile">
                        <!--img--->
                        <img src="images/client-2.jpg" alt="client">
                        <!--text-->
                        <div class="profile-text">
                            <strong>Adward Mcavoy</strong>
                            <span>Software Developer</span>
                        </div>
                    </div>
                    <!--==Rating======-->
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <!--==comments===-->
                    <p>I had to walk to the nearby store at least twice a day to purchase and fill in the empty grocery jars in my home. It's probably a good thing that I found this website. Its really amazing to shop with Raashan Bazaar when you want something fast. Customer service is also great</p>
                </div>
                <!--box------------->
                <div class="client-box">
                    <!--==profile===-->
                    <div class="client-profile">
                        <!--img--->
                        <img src="images/client-3.jpg" alt="client">
                        <!--text-->
                        <div class="profile-text">
                            <strong>Ava Alex</strong>
                            <span>Marketer</span>
                        </div>
                    </div>
                    <!--==Rating======-->
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <!--==comments===-->
                    <p>Oh my goodness... You know, this place has very good groceries at reasonable price for all items like oils, flours, ghee and so on. I have saved a lot both time and money by shopping through Raashan Bazaar</p>
                </div>
            </div>
        </section>
        <!--client-section-end---------->
        <!--==Partnre-logo================================-->
        <section id="partner">
            <!--heading------------>
            <div class="partner-heading">
                <h3>Our Trusted Partner</h3>
            </div>
            <!--logo-container----->
            <div class="logo-container">
                <img src="images/logo-1.png" alt="logo">
                <img src="images/logo-2.png" alt="logo">
                <img src="images/logo-3.png" alt="logo">
                <img src="images/logo-4.png" alt="logo">
            </div>
        </section>
        <!--logo-section-end--------------------->
        <!--==download-app====================================-->
        
        <!--download-app-section-end------------------------->
        <!--==Footer=============================================-->
        <footer>
            <div class="footer-container">
                <!--logo-container------>
                <div class="footer-logo">
                    <a href="#"><span>Raashan</span> Bazaar</a>
                    <!--social----->
                        <div class="download-btns"><a href="https://apps.apple.com/in/app/bigbasket-com/id660683603?ign-mpt=uo%3D4"><img src="images/appstore-btn.png" alt=""></a>
                        <a href="https://play.google.com/store/apps/details?id=com.bigbasket.mobileapp"><img src="images/googleplay-btn.png" alt=""></a> <br></br></div>
                        <div class="footer-social">
                        <a href="https://www.facebook.com/Bigbasketcom"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com/bigbasket_com"><i class="fab fa-twitter"></i></a>
                        <a href="https://instagram.com/bigbasketcom?igshid=MzRlODBiNWFlZA=="><i class="fab fa-instagram"></i></a>
                        <a href="https://www.youtube.com/@bigbasketofficial"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <!--links------------------------->
            <div class="footer-links">
                <strong>Category</strong>
                <ul>
                    <li><a href="#">Frozen Food</a></li>
                    <li><a href="#">Diapers&wipes</a></li>
                    <li><a href="#">Floor Cleaners</a></li>
                    <li><a href="#">Organic F&V</a></li>
                </ul>
            </div>
            <!--links------------------------->
            <div class="footer-links">
                <strong>Help</strong>
                <ul>
                    <li><a href="#">About us</a></li>
                    <li><a href="#">Contact us</a></li>
                    <li><a href="terms.jsp">Terms and Conditions</a></li>
                    <li><a href="https://blog.bigbasket.com/?nc=bt">Blog</a></li>
                </ul>
            </div>
            <!--links-------------------------->
            <div class="footer-links">
                <strong>Contact</strong>
                <ul>
                    <li><a href="#">Phone : 1800-623-1000</a></li>
                    <li><a href="#">Email : RaashanBazaar@gmail.com</a></li>
                </ul>
            </div> 
      
            </div>
        </footer>
        
        
    </body>
    </html> 