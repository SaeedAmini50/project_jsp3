<%@ page import="java.sql.*" 
import="project.ConnectionProvider"
%>


<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
 
<%@ include file="header.jsp" %>



<!DOCTYPE html>
<html lang="en">
 <head>
 
<script>
  function search() {
    var selectedFruit = "";

    // یافتن دکمه رادیویی انتخاب شده
    var radios = document.getElementsByName("search_product");
    radios.forEach(function(radio) {
      if (radio.checked) {
        selectedFruit = radio.value;
      }
    });

    // ارسال اطلاعات به سمت سرور (به عنوان مثال، با استفاده از نشانوند فرم)
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "search_product.jsp";

    // ایجاد و افزودن یک المان input برای ارسال مقدار دکمه رادیویی انتخاب شده
    var input = document.createElement("input");
    input.type = "hidden";
    input.name = "search_product";
    input.value = selectedFruit;
    form.appendChild(input);

    // افزودن فرم به صفحه و ارسال آن
    document.body.appendChild(form);
    form.submit();
  }
  </script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Electro - HTML Ecommerce Template</title>

   <!-- Google font -->
   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

   <!-- Bootstrap -->
   <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

   <!-- Slick -->
   <link type="text/css" rel="stylesheet" href="css/slick.css"/>
   <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

   <!-- nouislider -->
   <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

   <!-- Font Awesome Icon -->
   <link rel="stylesheet" href="css/font-awesome.min.css">

   <!-- Custom stlylesheet -->
   <link type="text/css" rel="stylesheet" href="css/style.css"/>

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    </head>
 <body>
	  <% try{
		
		  String search=request.getParameter("search");
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs;


%>

<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<div class="col-md-12">
<div class="section-title">
<div class="section-nav">
<ul class="section-tab-nav tab-nav">
<h1><li class="active"><a  name="NEW"data-toggle="tab" href="#tab2">محصولات باارزش</a></li></h1>

</ul>
</div>
</div>
</div>
<!-- shop -->

<div class="col-md-4 col-xs-6">
<div class="shop">
<div class="shop-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="shop-body">
<h3>AKAI <br>smart</h3>
<a href="#" class="cta-btn">AF 35,000 <i class="fa fa-arrow-circle-right"></i></a>
</div>
</div>
</div>
<!-- /shop -->

<!-- shop -->
<div class="col-md-4 col-xs-6">
<div class="shop">
<div class="shop-img">
<img src="./img/TVV.jpg" alt="" >
</div>
<div class="shop-body">
<h3>ECO <br>smart</h3>
<a href="#" class="cta-btn">AF 35,000<i class="fa fa-arrow-circle-right"></i></a>
</div>
</div>
</div>
<!-- /shop -->

<!-- shop -->
<div class="col-md-4 col-xs-6">
<div class="shop">
<div class="shop-img">
<img src="./img/TVV.jpg" alt="">
</div>
<div class="shop-body">
<h3>Blaupunkt <br>smart</h3>
<a href="#" class="cta-btn">AF 35,000 <i class="fa fa-arrow-circle-right"></i></a>
</div>
</div>
</div>
<!-- /shop -->
</div>
<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /SECTION -->


  <!-- SECTION -->
  <div class="section">
   <!-- container -->
   <div class="container">
    <!-- row -->
    <div class="row">
	 
	 


   
   <div id="store" class="col-md-3">
						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">پیدا کردن مارک محصولات</h3>
							<div class="checkbox-filter">
							<form>
								<div class="input-radio">
									<input type="radio" name="search_product" value="samsung" onchange="search()" id="brand-7">
									<label for="brand-7">
										<span></span>
										SAMSUNG
										<small>(578)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="LG" onchange="search()" id="brand-8">
									<label for="brand-8">
										<span></span>
										LG
										<small>(125)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="sony" onchange="search()" id="brand-9">
									<label for="brand-9">
										<span></span>
										SONY
										<small>(755)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="panasonic" onchange="search()" id="brand-10">
									<label for="brand-10">
										<span></span>
										 panasonic
										<small>(578)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="philips" onchange="search()" id="brand-11">
									<label for="brand-11">
										<span></span>
										philips
										<small>(125)</small>
									</label>
								</div>
									<div class="input-radio">
									<input type="radio" name="search_product" value="BLAUPUNKT" onchange="search()" id="brand-12">
									<label for="brand-12">
										<span></span>
										BLAUPUNKT
										<small>(125)</small>
									</label>
								</div>
									<div class="input-radio">
									<input type="radio" name="search_product" value="TCL" onchange="search()"id="brand-13">
									<label for="brand-13">
										<span></span>
										TCL
										<small>(125)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="toshiba" onchange="search()" id="brand-14">
									<label for="brand-14">
										<span></span>
										TOSHIBA
										<small>(755)</small>
									</label>
								</div>
									<div class="input-radio">
									<input type="radio" name="search_product" value="EKO" onchange="search()" id="brand-15">
									<label for="brand-15">
										<span></span>
									EKO
										<small>(755)</small>
									</label>
								</div>
								
								</form>
															</div>
						</div>
						
						
   
   
   
						
						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">پیدا کردن سایز تلویزیون</h3>
							<div class="checkbox-filter">
								<div class="input-radio">
									<input type="radio" name="search_product" value="32 inch" onchange="search()" id="brand-1">
									<label for="brand-1">
										<span></span>
										32 inch
										<small>(578)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="40 inch" onchange="search()" id="brand-5">
									<label for="brand-5">
										<span></span>
									40 inch
										<small>(125)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="43 inch" onchange="search()" id="brand-2">
									<label for="brand-2">
										<span></span>
										43 inch
										<small>(125)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="50 inch" onchange="search()" id="brand-3">
									<label for="brand-3">
										<span></span>
								50 inch
										<small>(755)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="55 inch" onchange="search()" id="brand-4">
									<label for="brand-4">
										<span></span>
									55 inch
										<small>(578)</small>
									</label>
								</div>
								<div class="input-radio">
									<input type="radio" name="search_product" value="65 inch" onchange="search()" id="brand-5">
									<label for="brand-5">
										<span></span>
									65 inch
										<small>(125)</small>
									</label>
								</div>
							
							</div>
						</div>
						</div>
						<!-- /aside Widget -->

						
   
	    
     <!-- STORE -->
     <div id="store" class="col-md-9">
<h1 style="text-align:center">لیست محصولات</h1>

      <!-- store products -->
      <div class="row" >

	

<% 


rs=st.executeQuery(" SELECT * FROM product INNER JOIN product_category ON product.category_ID = product_category.category_ID where name_category='TV';");


while(rs.next()){%>
       <!-- product -->
       <div class="col-md-4 col-xs-6">
        <div class="product">
         <div class="product-img">
          <img src="./img/machin7.jpg" alt="">
         </div>
         <div class="product-body">
          <p class="product-category"> <%=rs.getString(11) %> </p>
          <h3 class="product-name"><a href="#"><%=rs.getString(1) %> <span style="color:red"><%=rs.getString(3) %> </span>  </a></h3>
          <h4 class="product-price">AF <%=rs.getString(2) %> </h4>
          <label class="hidden"><%=rs.getString(8) %></label>
          <div class="product-rating">
           <i class="fa fa-star"></i>
           <i class="fa fa-star"></i>
           <i class="fa fa-star"></i>
           <i class="fa fa-star"></i>
           <i class="fa fa-star-o"></i>
          </div>
          <div class="product-btns">
           <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
           <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
           <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
          </div>
         </div>
         <div class="add-to-cart">
          <button class="add-to-cart-btn"><a href="AddToCartAction.jsp?product_ID=<%=rs.getString(8) %>"><i class="fa fa-shopping-cart"></i> add to cart</a></button>
         </div>
        </div>
       </div>
       <!-- /product -->
                 <% 
                            }}
                            
catch(Exception e)  {
	System.out.print(e);
	
}%>





      </div>
      <!-- /store products -->

  </div>
      <!-- /store bottom filter -->
	  
	

     </div>
     <!-- /STORE -->
    </div>
    <!-- /row -->
   </div>
   <!-- /container -->

  <!-- /SECTION -->

  <!-- NEWSLETTER -->
  <div id="newsletter" class="section">
   <!-- container -->
   <div class="container">
    <!-- row -->
    <div class="row">
     <div class="col-md-12">
      <div class="newsletter">
       <p>Sign Up for the <strong>NEWSLETTER</strong></p>
       <form>
        <input class="input" type="email" placeholder="Enter Your Email">
        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
       </form>
       <ul class="newsletter-follow">
        <li>
         <a href="#"><i class="fa fa-facebook"></i></a>
        </li>
        <li>
         <a href="#"><i class="fa fa-telegram"></i></a>
        </li>
        <li>
         <a href="#"><i class="fa fa-whatsapp"></i></a>
        </li>
       
       </ul>
      </div>
     </div>
    </div>
    <!-- /row -->
   </div>
   <!-- /container -->
  </div>
  <!-- /NEWSLETTER -->
  
  <%@ include file="footer.jsp" %>
  
  <!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
