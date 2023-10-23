<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
    <%@ include file="header.jsp" %>
 
    

<!DOCTYPE html>
<html lang="en">
<head>
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
<!-- NAVIGATION -->
<nav id="navigation">
<!-- container -->
<div class="container">
<!-- responsive-nav -->
<div id="responsive-nav">
  <!-- NAV -->
     <ul class="main-nav nav navbar-nav">
	       <li class="active"><a href="index.jsp">صفحه اصلی</a></li>
      <li><a href="#"></a></li>
      <li class="active"><a href="#">تلویزیون</a></li>
      <li><a href="#"></a></li>
      <li><a href="storemachin.jsp">لباسشویی</a></li>

     </ul>
     <!-- /NAV -->
</div>
<!-- /responsive-nav -->
</div>
<!-- /container -->
</nav>
<!-- /NAVIGATION -->

<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<!-- Product main img -->
<div class="col-md-5 col-md-push-2">
<div id="product-main-img">
<div class="product-preview">
<img src="./img/TV2.jpg" alt="">
</div>

<div class="product-preview">
<img src="./img/TV3.jpg" alt="">
</div>

<div class="product-preview">
<img src="./img/TV4.png" alt="">
</div>

<div class="product-preview">
<img src="./img/TVV.jpg" alt="">
</div>
</div>
</div>
<!-- /Product main img -->

<!-- Product thumb imgs -->
<div class="col-md-2  col-md-pull-5">
<div id="product-imgs">
<div class="product-preview">
<img src="./img/TV2.jpg" alt="">
</div>

<div class="product-preview">
<img src="./img/TV3.jpg" alt="">
</div>

<div class="product-preview">
<img src="./img/TV4.png" alt="">
</div>

<div class="product-preview">
<img src="./img/TVV.sjpg" alt="">
</div>
</div>
</div>
<!-- /Product thumb imgs -->

<!-- Product details -->
<div class="col-md-5">
<div class="product-details">
<h2 class="product-name">TV 43 inch philips</h2>
<div>
<div class="product-rating">
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star-o"></i>
</div>
<a class="review-link" href="#">10 Review(s) | Add your review</a>
</div>
<div>
<h3 class="product-price">AF 14000 <del class="product-old-price">AF 14500</del></h3>
<span class="product-available">In Stock</span>
</div>
<p>محصول مورد نظر دارای کیفیت فوق العاده و صدایی با کیفیت و  گارانتی یک ساله میباشد و دارای زیبایی خاصی  میباشد</p>

<div class="add-to-cart">

<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
</div>

<ul class="product-btns">
<li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>

</ul>


<ul class="product-links">
<li>Share:</li>
<li><a href="#"><i class="fa fa-facebook"></i></a></li>
<li><a href="#"><i class="fa fa-whatsapp"></i></a></li>
<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
<li><a href="#"><i class="fa fa-telegram"></i></a></li>
</ul>

</div>
</div>
</div>
<!-- /row-->
</div>
<!-- /container -->
</div>
<!-- /section -->
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
