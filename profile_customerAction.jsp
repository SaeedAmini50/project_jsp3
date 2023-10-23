<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>


<%
String email=session.getAttribute("email").toString();
String customer_name=request.getParameter("customer_name");
String customer_last_name=request.getParameter("customer_last_name");
String Security_Question=request.getParameter("Security_Question");
String customer_answer=request.getParameter("customer_answer");
String password=request.getParameter("password");

try{
	

Connection con = ConnectionProvider.getCon();

PreparedStatement ps=con.prepareStatement("update customer set customer_name=?,customer_last_name=?,Security_Question=?,customer_answer=?,password=?  where email=?;");

ps.setString(1,customer_name);
ps.setString(2,customer_last_name);
ps.setString(3,Security_Question);
ps.setString(4,customer_answer);
ps.setString(5,password);
ps.setString(6,email);
ps.executeUpdate();





response.sendRedirect("profile_customer.jsp?msg=done");


}
catch(Exception e){
	response.sendRedirect("errer.jsp?msg=invalid");
	System.out.println(e);
}

%>
