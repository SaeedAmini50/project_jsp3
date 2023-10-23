<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" 
import="project.ConnectionProvider"
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
      <title>Admin panel smart store</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="libAdmin/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="libAdmin/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<!-- Customized Bootstrap Stylesheet -->
    <link href="cssAdmin/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="cssAdmin/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class=" bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="indexAdmin.jsp" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>Smart Store</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">saeed</h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="indexAdmin.jsp" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
     
                    <a href="form.jsp" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                    <a href="table.jsp" class="nav-item nav-link active"><i class="fa fa-table me-2"></i>Tables</a>
                     <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="singin.jsp" class="dropdown-item">Sign In</a>
                            <a href="singup.jsp" class="dropdown-item">Sign Up</a>
                             <a href="forgotpassword.jsp" class="dropdown-item">Forgot Password</a>
                            <a href="404.jsp" class="dropdown-item">404 Error</a>
                            <a href="black.jsp" class="dropdown-item">Blank Page</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->
        
          <!--start jsp -->
        
        
         <div>
	 <%
	 String msg=request.getParameter("msg");
         if("done".equals(msg)){  
        	 System.out.print("show product");
        	 
        	 %>
				 <h1 >Welcome... show product</h1>
				 <%}%>
				 <%
				 if("wrongedit".equals(msg)){
					 System.out.print("soorrrry system can not show product");
				 %>
				 <h1>soorrrry system can not show product</h1>
	<% } %>
        
        
        </div>
        
          <!-- End jsp-->
        
        
        
        
        
    <!-- Sidebar End -->      
<div class="content">

    
					<!-- start table -->
                    <div class="col-sm-12 col-xl-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h6 class="mb-4">اضافه کردن محصول</h6>
                            <table class="table">
                                <thead>
                                 <tr>
                                        <th scope="col">Edit <i class="fas fa-pen-fancy"></i></th>
                                        <th scope="col">اسم محصول</th>
                                         <th scope="col">دسته بندی </th>
                                        <th scope="col">قیمت محصول</th>
                                        <th scope="col">سایز محصول</th>
                                        <th scope="col">صفت  محصول</th>
                                        <th scope="col">مارک محصول</th>
                                        <th scope="col">عکس محصول</th>
                                        <th scope="col">سود محصول</th>
                                        <th scope="col">فعالیت</th>
                                        <th scope="col">ID</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% 
                                try{
                                	


Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from product;");
while(rs.next()){%>
                                    <tr>
                                    <th> <a href="EditProduct.jsp?product_ID=<%= rs.getString(8) %>">Edit <i class="fas fa-pen-fancy"></i></a> </th>
                                        <td name="name"> <%=rs.getString(1) %></td>
                                        <td name="categoryID"><%=rs.getString(10) %></td>
                                        <td name="price"><%=rs.getString(2) %></td>
                                        <td name="size"><%=rs.getString(3) %></td>
                                        <td name="attribute"><%=rs.getString(4)  %></td>
                                        <td name="mark"><%=rs.getString(5)  %></td>
                                        <td name="photo"><%=rs.getString(6) %></td>
                                        
                                        
                                           <td name="benefit"><%=rs.getString(9) %></td>
                                           <td name="active"><%=rs.getString(7) %></td>
                                              <td name="ID"><%=rs.getString(8) %></td>
                                     
                                    </tr>
                                    <% 
                            }}
                            
catch(Exception e)  {
	System.out.print(e);
	
}%>
       
                                </tbody>
                            </table>
                                                       
                        </div>
                    </div>
					<!-- table end -->

					
					</div>


        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="libAdmin/chart/chart.min.js"></script>
    <script src="libAdmin/easing/easing.min.js"></script>
    <script src="libAdmin/waypoints/waypoints.min.js"></script>
    <script src="libAdmin/owlcarousel/owl.carousel.min.js"></script>
    <script src="libAdmin/tempusdominus/js/moment.min.js"></script>
    <script src="libAdmin/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="libAdmin/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="jsAdmin/main.js"></script>
</body>

</html>