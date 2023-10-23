<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>


<%

String customer_email=request.getParameter("customer_email");
String Security_Question=request.getParameter("Security_Question");
String customer_answer=request.getParameter("customer_answer");
String new_password=request.getParameter("new_password");
String customer_password2=request.getParameter("customer_password2");

int check=0;

try{

Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
	if (new_password.equals(customer_password2)){


ResultSet rs=st.executeQuery("select * from customer where customer_email='"+customer_email+"'  and Security_Question='"+Security_Question+"' and customer_answer='"+customer_answer+"';");
 
while(rs.next()){
	check = 1;
	st.executeUpdate("update customer set customer_password='"+new_password+"' where customer_email='"+customer_email+"'; ");
	response.sendRedirect("forgotpassword.jsp?msg=done");
}
	}
else {
	
	response.sendRedirect("forgotpassword.jsp?msg=invalidPassword");
	
}
	
	
if (check==0){
	
	response.sendRedirect("forgotpassword.jsp?msg=invalid");
}

 
}
catch(Exception e)  {
	System.out.print(e);
	
}

%>