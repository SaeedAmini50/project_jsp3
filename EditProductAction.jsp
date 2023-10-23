<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<% 

String product_name=request.getParameter("product_name");
String product_price=request.getParameter("product_price");
String product_attribute=request.getParameter("product_size");
String product_size=request.getParameter("product_attribute");
String product_mark=request.getParameter("product_mark");
String product_photo=request.getParameter("product_photo");
String product_benefit=request.getParameter("product_benefit");
String product_active=request.getParameter("product_active");
String product_ID=request.getParameter("product_ID");
try{
	

Connection con = ConnectionProvider.getCon();
Statement st= con.createStatement();
st.executeUpdate("update product set product_name='"+product_name+"',product_price='"+product_price+"',product_attribute='"+product_attribute+"',product_size='"+product_size+"',product_mark='"+product_mark+"',product_photo='"+product_photo+"',product_benefit='"+product_benefit+"',product_active='"+product_active+"' where product_ID='"+product_ID+"';");

if (product_active.equals("no")){
	
	st.executeUpdate("delete from cart where product_ID='"+product_ID+"'");
	
}
response.sendRedirect("showAllProduct.jsp?msg=done");


}
catch(Exception e){
	response.sendRedirect("errer.jsp?msg=invalid");
	System.out.println(e);
}

 %>