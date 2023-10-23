<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>


<%

String customer_name=request.getParameter("customer_name");
String customer_last_name=request.getParameter("customer_last_name");
String customer_email=request.getParameter("email");
String Security_Question=request.getParameter("Security_Question");
String customer_answer=request.getParameter("customer_answer");
String customer_password=request.getParameter("password");
String customer_password2=request.getParameter("customer_password2");

	
try{

	if (customer_password.equals(customer_password2)){
		
Connection con = ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("INSERT INTO customer (customer_name,customer_last_name,email,Security_Question,customer_answer,password,customer_date) values(?,?,?,?,?,?,now());");
ps.setString(1,customer_name);
ps.setString(2,customer_last_name);
ps.setString(3,customer_email);
ps.setString(4,Security_Question);
ps.setString(5,customer_answer);
ps.setString(6,customer_password);
ps.executeUpdate();

Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from customer where email='"+customer_email+"' and password='"+customer_password+"'   and customer_name='"+customer_name+"' and customer_last_name='"+customer_last_name+"' and Security_Question='"+Security_Question+"' and customer_answer='"+customer_answer+"';");
while (rs.next()){

	session.setAttribute("email",customer_email);
	response.sendRedirect("index.jsp");
	
	
}
response.sendRedirect(".jsp?msg=valid");
}
	else {
		
		response.sendRedirect("singup.jsp?msg=invalidPassword");
	
	}
}

catch(Exception e){
System.out.print(e);


}
%>
