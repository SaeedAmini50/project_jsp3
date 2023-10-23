<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
String customer_email=session.getAttribute("email").toString();
String product_ID=request.getParameter("product_ID");
String incdec=request.getParameter("quantity_cart");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
int customer_ID=0;
try{

Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();

ResultSet rs4=st.executeQuery("select * from customer where email='"+customer_email+"' ;");

while(rs4.next()){

	customer_ID=rs4.getInt(1);

}




ResultSet rs1=st.executeQuery("select * from product inner join cart inner join customer on product.product_ID=cart.product_ID and customer.customer_ID=cart.customer_ID where customer.customer_ID='"+customer_ID+"'  and product.product_ID='"+product_ID+"' and  cart.customer_ID='"+customer_ID+"' and cart.product_ID='"+product_ID+"';");
System.out.print("hello4");
		while (rs1.next()){
			
			
	price=rs1.getInt(2);
	total=rs1.getInt(13);
	quantity=rs1.getInt(12);
	
	
}

	


if (quantity==1 && incdec.equals("decrease")){
	
	response.sendRedirect("myCart.jsp?msg=notPossible");
}
else if (quantity !=1 && incdec.equals("decreased")){
	
	total=total - price;
	quantity=quantity-1;
	st.executeUpdate("UPDATE cart INNER JOIN customer INNER JOIN product ON cart.product_ID = product.product_ID and customer.customer_ID = cart.customer_ID  SET cart.total_price_cart ='"+total+"',cart.quantity_cart='"+quantity+"' where cart.customer_ID='"+customer_ID+"' and cart.product_ID='"+product_ID+"' ");
	
	
	
	
	
	response.sendRedirect("myCart.jsp?msg=decreased");  
	
}
	
else{	total=total + price;
	quantity=quantity+1;
	st.executeUpdate("UPDATE cart INNER JOIN customer INNER JOIN product ON cart.product_ID = product.product_ID and customer.customer_ID = cart.customer_ID  SET cart.total_price_cart ='"+total+"',cart.quantity_cart='"+quantity+"' where   cart.customer_ID='"+customer_ID+"' and cart.product_ID='"+product_ID+"' ");
	response.sendRedirect("myCart.jsp?msg=increased");  
	
	
	
}
	
}

catch(Exception e)  {
System.out.print(e);

} 	



%>