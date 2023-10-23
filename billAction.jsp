<%@ page import="java.sql.*" 
import="project.ConnectionProvider"%>

 <%


 String email=session.getAttribute("email").toString();
 int total_price_order= 0 ;
 int total= 0 ;
 int order_ID= 0 ;
 int quantity_item= 0 ;
 int price_item= 0 ;
 int item_ID= 0 ;
 int product_ID= 0 ;
 int shipment_ID=0;
 int payment_ID=0;
 String status="bill";
try {
	
	
Connection con = ConnectionProvider.getCon();
Statement st=con.createStatement();
	

int customer_ID=0;


ResultSet rs=st.executeQuery("select * from customer where email='"+email+"' ;");
while(rs.next()){
	
	customer_ID=rs.getInt(1);

}


ResultSet rs1=st.executeQuery("select sum(total_price_cart) from product inner join cart inner join customer on product.product_ID=cart.product_ID and customer.customer_ID=cart.customer_ID where customer.customer_ID='"+customer_ID+"'");
	


		
while (rs1.next()){
	total=rs1.getInt(1);
}








	ResultSet rs2=st.executeQuery("select max(payment_ID) from payment;");
	while(rs2.next()){
		
		payment_ID=rs2.getInt(1); 
	}		
	

ResultSet rs3=st.executeQuery("select max(shipment_ID) from shipment;");
while(rs3.next()){

shipment_ID=rs3.getInt(1); 
}
	
	PreparedStatement ps = con.prepareStatement("INSERT INTO orders (total_price_order,customer_ID,payment_ID,shipment_ID,order_date) VALUES("+total+","+customer_ID+","+payment_ID+","+shipment_ID+",now());");

	ps.executeUpdate();
	
	

	ResultSet rs4=st.executeQuery("select max(order_ID) from orders;");	
	while(rs4.next()){
		 order_ID=rs4.getInt(1);
		   
	   }
	   

	 
	  ResultSet rs5=st.executeQuery("select * from product inner join cart inner join customer on product.product_ID=cart.product_ID and customer.customer_ID=cart.customer_ID where customer.customer_ID="+customer_ID+"");
	   while(rs5.next()){
		   
		   quantity_item=rs5.getInt(12);
		   price_item=rs5.getInt(2);
		   product_ID=rs5.getInt(8);

		   PreparedStatement ps1 = con.prepareStatement("INSERT INTO order_item (quantity_item,price_item,product_ID,order_ID) VALUES("+quantity_item+","+price_item+","+product_ID+","+order_ID+");");
		   
		    ps1.executeUpdate();

		
	   }	
	   
	   ResultSet rs6=st.executeQuery("select max(item_ID) from order_item;");	
		while(rs6.next()){
			 item_ID=rs6.getInt(1);
			   
		   }
		   

	  
	
	response.sendRedirect("bill.jsp?order_ID="+order_ID+"&item_ID="+item_ID);
}

catch(Exception e){
	
	System.out.print(e);
}
 
 
 
 
 
 
 %>