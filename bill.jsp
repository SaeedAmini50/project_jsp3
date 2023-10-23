<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Example 2</title>
   <style>
   
   @font-face {
  font-family: SourceSansPro;
  src: url(SourceSansPro-Regular.ttf);
}

.clearfix:after {
  content: "";
  display: table;
  clear: both;
}

a {
  color: #0087C3;
  text-decoration: none;
}

body {
  position: relative;
  width: 21cm;  
  height: 29.7cm; 
  margin: 0 auto; 
  color: #555555;
  background: #FFFFFF; 
  font-family: Arial, sans-serif; 
  font-size: 14px; 
  font-family: SourceSansPro;
}

header {
  padding: 10px 0;
  margin-bottom: 20px;
  border-bottom: 1px solid #AAAAAA;
}

#logo {
  float: left;
  margin-top: 8px;
}

#logo img {
  height: 70px;
}

#company {
  float: right;
  text-align: right;
}


#details {
  margin-bottom: 50px;
}

#client {
  padding-left: 6px;
  border-left: 6px solid #0087C3;
  float: left;
}

#client .to {
  color: #777777;
}

h2.name {
  font-size: 1.4em;
  font-weight: normal;
  margin: 0;
}

#invoice {
  float: right;
  text-align: right;
}

#invoice h1 {
  color: #0087C3;
  font-size: 2.4em;
  line-height: 1em;
  font-weight: normal;
  margin: 0  0 10px 0;
}

#invoice .date {
  font-size: 1.1em;
  color: #777777;
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  margin-bottom: 20px;
}

table th,
table td {
  padding: 20px;
  background: #EEEEEE;
  text-align: center;
  border-bottom: 1px solid #FFFFFF;
}

table th {
  white-space: nowrap;        
  font-weight: normal;
}

table td {
  text-align: right;
}

table td h3{
  color: #57B223;
  font-size: 1.2em;
  font-weight: normal;
  margin: 0 0 0.2em 0;
}

table .no {
  color: #FFFFFF;
  font-size: 1.6em;
  background: #57B223;
}

table .desc {
  text-align: left;
}

table .unit {
  background: #DDDDDD;
}

table .qty {
}

table .total {
  background: #57B223;
  color: #FFFFFF;
}

table td.unit,
table td.qty,
table td.total {
  font-size: 1.2em;
}

table tbody tr:last-child td {
  border: none;
}

table tfoot td {
  padding: 10px 20px;
  background: #FFFFFF;
  border-bottom: none;
  font-size: 1.2em;
  white-space: nowrap; 
  border-top: 1px solid #AAAAAA; 
}

table tfoot tr:first-child td {
  border-top: none; 
}

table tfoot tr:last-child td {
  color: #57B223;
  font-size: 1.4em;
  border-top: 1px solid #57B223; 

}

table tfoot tr td:first-child {
  border: none;
}

#thanks{
  font-size: 2em;
  margin-bottom: 50px;
}

#notices{
  padding-left: 6px;
  border-left: 6px solid #0087C3;  
}

#notices .notice {
  font-size: 1.2em;
}

footer {
  color: #777777;
  width: 100%;
  height: 30px;
  position: absolute;
  bottom: 0;
  border-top: 1px solid #AAAAAA;
  padding: 8px 0;
  text-align: center;
}

   
   
   
   </style>
  </head>
  <body>
     <%  String email=session.getAttribute("email").toString();  %> 
  <% 
  try{
	
	  
	  String order_ID=request.getParameter("order_ID");
	  String item_ID=request.getParameter("item_ID");
	  
	  
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs;






int customer_ID=0;


ResultSet rs1=st.executeQuery("select * from customer where email='"+email+"' ;");
while(rs1.next()){
	
	customer_ID=rs1.getInt(1);
}

%>
  
    <header class="clearfix">
      <div id="logo">
        <img src="img/logo.jpg">
      </div>
      <div id="company">
        <h2 class="name">Smart Store</h2>
        <div>455 Foggy Heights, AZ 85004, US</div>
        <div>+93799644575</div>
        <div><a href="mailto:company@example.com">smartstor575@email.com</a></div>
      </div>
    
    </header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
        
        

  <% 
 	
rs=st.executeQuery("select * from customer INNER JOIN orders  INNER JOIN shipment  ON   orders.customer_ID = customer.customer_ID   and  shipment.shipment_ID = orders.shipment_ID where customer.customer_ID="+customer_ID+" and orders.order_ID="+order_ID+"; ");
  
while(rs.next()){%>
                
        
        
          <div class="to">INVOICE TO:</div>
            <h2 class="name">ID:<%=rs.getString(1) %> </h2>
          <h2 class="name">NAME:<%=rs.getString(3) %> <%=rs.getString(4) %> </h2>
          <div class="address">ADDRESS:<%=rs.getString(16) %>,<%=rs.getString(17)%>,<%=rs.getString(18)%>  </div>
          <div class="email"><a href="mailto:john@example.com">EMAIL:<%=rs.getString(2) %> </a></div>
                <div class="phone">PHONE:<%=rs.getString(19)%></div>
              <%break; }%> 
             
               <% 
 	
rs=st.executeQuery("select * from customer INNER JOIN orders  INNER JOIN payment  ON   orders.customer_ID = customer.customer_ID   and  payment.payment_ID = orders.payment_ID where customer.customer_ID="+customer_ID+" and orders.order_ID="+order_ID+"; ");
  
while(rs.next()){%>
      
              
        </div>
        <div id="invoice">
          <h1>INVOICE </h1>
          <div class="date">Date of Invoice: <%=rs.getDate(18) %></div>
           <div class="date">Delivery Date of Invoice: <%=rs.getDate(19) %></div>
          <div class="date">Due Date of Invoice: <%=rs.getDate(20) %></div>
        </div>
      </div>
      <%break;} %>
                           
      
       
      
      
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="no">#</th>
            <th class="unit">NAME PRODUCT</th>
            <th class="qty">CATEGORY</th>
            <th class="unit">QUANTITY</th>
             <th class="qty">PRICE</th>
            <th class="total">SUB TOTAL</th>
          </tr>
        </thead>
        
        <tbody>
        
  <% 
 int sno=0;
rs1=st.executeQuery("select * from product INNER JOIN order_item  INNER JOIN orders  ON    product.product_ID = order_item.product_ID  and order_item.order_ID = orders.order_ID where order_item.order_ID="+order_ID+";");
  
while(rs1.next()){%>
                
           <% sno=sno+1; %> 
     
          <tr>
            <td class="no"><%=sno %></td>
             <td class="unit"><%=rs1.getString(1) %></td>
           <td class="qty"><%=rs1.getString(10) %></td>
            <td class="unit"><%=rs1.getString(12) %></td>
             <td class="qty"><%=rs1.getString(2) %></td>
                    <td class="total"><%=rs1.getInt(12) * rs1.getInt(2)%> </td>
          </tr>
         <%} %>
        </tbody>
        <tfoot>
                 
  <% 
  ResultSet rs2=st.executeQuery("select sum(total_price_order) from product INNER JOIN order_item  INNER JOIN orders  ON    product.product_ID = order_item.product_ID  and order_item.order_ID = orders.order_ID where order_item.order_ID="+order_ID+";");
  
while(rs2.next()){%>
     
          <tr>
          
            <td colspan="2"></td>
            <td colspan="2">TOTAL</td>
            <td><%=rs2.getInt(1)%></td>
          </tr>
          <tr>
          
            <td colspan="2"></td>
            <td colspan="2">TAX 0%</td>
            <td>0</td>
          </tr>
          <tr>
            <td colspan="2"></td>
            <td colspan="2">GRAND TOTAL</td>
            <td><%=rs2.getInt(1)%></td>
          </tr>
          <%} %>
        </tfoot>
      </table>
      <div id="thanks">Thank you!</div>
      <div id="notices">
        <div>NOTICE:</div>
        <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
      </div>
    </main>
    <footer>
      Invoice was created on a computer and is valid without the signature and seal.
    </footer>
    
    
    
                 <% 
 }
                            
catch(Exception e)  {
	System.out.print(e);
	
}
%>
  </body>
</html>


