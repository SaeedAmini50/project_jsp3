<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");


	int z=0;
try{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs;
ResultSet rs1;


rs=st.executeQuery("select * from customer where email='"+email+"' and password='"+password+"'");

 while (rs.next()){
	
	session.setAttribute("email",email);
	session.setAttribute("",email);
	response.sendRedirect("index.jsp");
	z++;
}

if(z==0){
 rs1=st.executeQuery("select * from admin where email='"+email+"' and password='"+password+"'");
while (rs1.next()){
	
	session.setAttribute("admin_email",email);
	response.sendRedirect("indexAdmin.jsp");
	z++;
}
}
else {response.sendRedirect("singin.jsp?msg=notexist");}
}
catch(Exception e){
System.out.println(e);
}

%>
