<%@ page import="java.sql.*" 
import="project.ConnectionProvider"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

 <%
	
 String email=session.getAttribute("email").toString();
 String address=request.getParameter("customer_address");
 String city=request.getParameter("customer_city");
 String country=request.getParameter("customer_country");
 String  phone=request.getParameter("customer_phone");
 
 String  amoung_payment=request.getParameter("amoung_payment");
 String  payment_method=request.getParameter("payment_method");
 
 //transaction_ID شاید خالی باشد شاید یوزر پر کرد 
 String  transaction_ID="";
   transaction_ID=request.getParameter("transactionID");

 

try {
	
	
Connection con = ConnectionProvider.getCon();
Statement st=con.createStatement();

int customer_ID=0;


ResultSet rs=st.executeQuery("select * from customer where email='"+email+"' ;");
while(rs.next()){
	
	customer_ID=rs.getInt(1);

}





PreparedStatement ps = con.prepareStatement("INSERT INTO shipment (customer_country,customer_city,customer_address,customer_phone,customer_ID,shipment_date) VALUES(?,?,?,?,"+customer_ID+",now());");

	ps.setString(1,country);
	ps.setString(2,city);
	ps.setString(3,address);
	ps.setString(4,phone);
	
	ps.executeUpdate();
	
	
	
	PreparedStatement ps1 = con.prepareStatement("INSERT INTO payment (amoung_payment,payment_method,customer_ID,payment_date,deliveryDate,Due_DATE) VALUES(?,?,"+customer_ID+",now(),DATE_ADD(payment_date,INTERVAL 10 DAY),DATE_ADD(payment_date,INTERVAL 30 DAY));");
	
			ps1.setString(1,amoung_payment);
			ps1.setString(2,payment_method);
			ps1.executeUpdate();

			
			
			
			response.sendRedirect("billAction.jsp");
			
			
}
 




catch(Exception e){
	
	System.out.print(e);
}
 %>
 
 
 
 
 
 
 
 
 