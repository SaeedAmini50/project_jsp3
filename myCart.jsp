
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>صفحه سبد خرید</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />
  <style>
    /* کدهای CSS در اینجا قرار می‌گیرند */
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }

    h1 {
      color: #333;
      text-align: center;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 10px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }

    tbody tr:hover {
      background-color: #f9f9f9;
    }

    tfoot td {
      font-weight: bold;
    }

    .checkout {
      text-align: center;
      margin-top: 20px;
    }

    .checkout button {
      padding: 10px 20px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      cursor: pointer;
    }

    .product-image {
      max-width: 100px;
    }

    .right-align {
      text-align: right;
    }
  </style>
  <script>
  
  
  
    // کدهای JavaScript در اینجا قرار می‌گیرند
    function updateTotal() {
      var total = 0;
      var quantities = document.getElementsByClassName("quantity");
      var prices = document.getElementsByClassName("price");
      var totalElement = document.getElementById("total");

      for (var i = 0; i < quantities.length; i++) {
        var quantity = parseInt(quantities[i].value);
        var price = parseFloat(prices[i].textContent);
        total += quantity * price;
      }

      totalElement.textContent = total.toFixed(2) + " AF";
    }
  </script>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg)){ %>
<h1>There is only one Quantity !So click on removel</h1>
<% }%>

<%if("increased".equals(msg)){ %>
<h1>Quantity Increased Successfully!</h1>
<% }%>

<%if("decreased".equals(msg)){ %>
<h1>Quantity Decreased Successfully!</h1>
<% }%>


<%if("removed".equals(msg)){ %>
<h1>Product Successfully Removed!</h1>
<% }%>
   <%
    int total=0;
    int sno=0;
    int customer_ID=0;
    try{
    	
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();




ResultSet rs4=st.executeQuery("select * from customer where email='"+email+"' ;");

while(rs4.next()){
	customer_ID=rs4.getInt(1);
}





ResultSet rs1=st.executeQuery("select sum(total_price_cart) from product inner join cart inner join customer on product.product_ID=cart.product_ID and customer.customer_ID=cart.customer_ID where customer.customer_ID='"+customer_ID+"'");
	


		
while (rs1.next()){
	total=rs1.getInt(1);
}
%>

<!-- NAVIGATION -->
<nav id="navigation">
<!-- container -->
<div class="container">
<!-- responsive-nav -->
<div id="responsive-nav">
<!-- NAV -->
<ul class="main-nav nav navbar-nav">

</ul>
<!-- /NAV -->
</div>
</div>






  <h1>سبد خرید</h1>
  <table>
    <thead>
    
 
    
    
      <tr>
       <th >ترتیب انتخاب محصول</th>
       <th> تصویر محصول</th>
          <th>مشخصات محصول</th>
       
          <th>اسم محصول </th>
        <th> اسم دسته بندی</th>
         <th> تعداد</th>
        <th> قیمت محصول</th>
        <th> جمع کل</th>
         <th> حذف محصول</th>
        
      </tr>
    </thead>
    <tbody>
    <% 
    ResultSet rs=st.executeQuery("select * from product inner join cart inner join customer on product.product_ID=cart.product_ID and customer.customer_ID=cart.customer_ID where customer.customer_ID='"+customer_ID+"'");
   while(rs.next()){
	 %>
    
      <tr>
     <% sno=sno+1; %> 
      <td class="right-align">  <% out.print(sno);%> </td>
        <td><img src="./img/machin7.jpg" alt="تصویر محصول" class="product-image"></td>
          <td name="size and attribute" class="right-align"><%=rs.getString(3)%> <br><%=rs.getString(4)%></td>
        
       
         <td name="name" class="right-align"><%=rs.getString(1)%></td>
            <td name="category" class="right-align"><%=rs.getString(10) %></td>
           <td name="quantity"><a href="IncDecQuantityAction.jsp?product_ID=<%=rs.getString(8)%>&quantity_cart=increased"><i class='fas fa-plus-circle'> </i></a> <%=rs.getString(12) %> <a href="IncDecQuantityAction.jsp?product_ID=<%=rs.getString(8)%>&quantity_cart=decreased"><i class="fas fa-minus-circle"></i></a> </td> 
        <td name="price"> <%=rs.getString(2) %></td>
        <td name="total">  <%=rs.getString(13) %></td>
        <td ><a  href="RemoveFromCart.jsp?cart_ID=<%=rs.getString(11) %>"> Remove <i class='fas fa-trash-alt'> </i> </a>  </td>
      </tr>
      <%} %>
      
      
      
      
      </tbody>
    <tfoot>
      <tr>
       <td colspan="4" class="right-align"><h1>   مجموعه پول </h1></td>
        <td id="total"> <h1>  <%out.println(total); %>   </h1></td>
       
      </tr>
    </tfoot>
  </table>
  <div class="checkout">
   <% if(total>0){%>
        	<button><li ><a href="AddressPaymentForOrder.jsp"> تسویه حساب</a></li></button>
      <%   } %>
  
   
  </div>
    <% 
    
   }
    
catch(Exception e)  {
System.out.print(e);

}
 %>   
</body>
</html>
    <%@ include file="footer.jsp" %>













