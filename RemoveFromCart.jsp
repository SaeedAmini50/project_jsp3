<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%

String cart_ID=request.getParameter("cart_ID");

try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	 st.executeUpdate(" delete  from cart where cart_ID='"+cart_ID+"'");
	
		response.sendRedirect("myCart.jsp?msg=removed");  
		

}
	catch(Exception e)  {
		System.out.print(e);
}
%>