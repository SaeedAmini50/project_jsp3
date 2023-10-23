<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" 
import="project.ConnectionProvider"
%>
<% 
	String customer_email=session.getAttribute("email").toString();
	String product_ID= request.getParameter("product_ID");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int customer_ID=0;
int z =0;
try {

Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from product where product_ID='"+product_ID+"' ;");

while(rs.next()){


	product_price =rs.getInt(2);
	product_total=product_price;	

}


ResultSet rs4=st.executeQuery("select * from customer where email='"+customer_email+"' ;");

while(rs4.next()){
	
	customer_ID=rs4.getInt(1);
	
}


ResultSet rs1=st.executeQuery("select * from product inner join cart inner join customer on product.product_ID=cart.product_ID and customer.customer_ID=cart.customer_ID where customer.customer_ID='"+customer_ID+"'  and product.product_ID='"+product_ID+"' and  cart.customer_ID='"+customer_ID+"' and cart.product_ID='"+product_ID+"';");

while (rs1.next()){

cart_total=rs1.getInt(13);
cart_total=cart_total+product_total;
quantity=rs1.getInt(12);
quantity=quantity+1;
z=1;
}

if (z==1){
	
	st.executeUpdate("UPDATE customer INNER JOIN cart ON customer.customer_ID = cart.customer_ID INNER JOIN product ON cart.product_ID = product.product_ID SET cart.total_price_cart='"+cart_total+"',quantity_cart='"+quantity+"'  where  customer.customer_ID='"+customer_ID+"'  and product.product_ID='"+product_ID+"' and  cart.customer_ID='"+customer_ID+"' and cart.product_ID='"+product_ID+"';" );
			
	response.sendRedirect("index.jsp");
	
}



if(z==0){

	PreparedStatement ps=con.prepareStatement("INSERT INTO cart(product_ID,customer_ID,quantity_cart,total_price_cart,orderDate,deliveryDate) values (?,?,?,?,now(),DATE_ADD(orderDate,INTERVAL 7 DAY));");
	
	ps.setString(1,product_ID);
ps.setInt(2,customer_ID);	
ps.setInt(3,quantity);
ps.setInt(4,product_total);
ps.executeUpdate();
response.sendRedirect("index.jsp?msg=added");
}




}


catch(Exception e){
System.out.print(e);
response.sendRedirect("index.jsp?msg=invalid");

}



%>
