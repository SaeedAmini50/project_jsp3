<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>


<%

String admin_email=session.getAttribute("admin_email").toString(); 
String admin_name=request.getParameter("admin_name");
String admin_last_name=request.getParameter("admin_last_name");
String Security_Question=request.getParameter("Security_Question");
String admin_answer=request.getParameter("admin_answer");
String admin_phone =request.getParameter("admin_phone");
String password=request.getParameter("password");

try{
	

Connection con = ConnectionProvider.getCon();
Statement st= con.createStatement();

PreparedStatement ps=con.prepareStatement("update admin set admin_name=?,admin_last_name=?,Security_Question=?,admin_answer=?,admin_phone=?,password=? where email=?;");
ps.setString(1,admin_name);
ps.setString(2,admin_last_name);
ps.setString(3,Security_Question);
ps.setString(4,admin_answer);
ps.setString(5,admin_phone);
ps.setString(6,password);
ps.setString(7,admin_email);
ps.executeUpdate();



response.sendRedirect("profile_admin.jsp?msg=done");
}
catch(Exception e){
System.out.println(e);
}

%>
