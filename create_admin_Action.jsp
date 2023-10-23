<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>


<%


String admin_name=request.getParameter("admin_name");
String admin_last_name=request.getParameter("admin_last_name");
String email=request.getParameter("email");
String admin_phone=request.getParameter("admin_phone");
String Security_Question=request.getParameter("Security_Question");
String admin_answer=request.getParameter("admin_answer");
String password=request.getParameter("password");
String password2=request.getParameter("password2");

	
	
try{

	if (password.equals(password2)){
		
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("INSERT INTO admin (admin_name,admin_last_name,email,admin_phone,Security_Question,admin_answer,password,admin_date) values(?,?,?,?,?,?,?,now());");
	ps.setString(1,admin_name);
	ps.setString(2,admin_last_name);
	ps.setString(3,email);
	ps.setString(4,admin_phone);
	ps.setString(5,Security_Question);
	ps.setString(6,admin_answer);
	ps.setString(7,password);
	ps.executeUpdate();

	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from admin where email='"+email+"' and password='"+password+"'   and admin_name='"+admin_name+"' and admin_last_name='"+admin_last_name+"' and admin_phone='"+admin_phone+"'  and Security_Question='"+Security_Question+"' and admin_answer='"+admin_answer+"';");
	while (rs.next()){

		
		
		session.setAttribute("admin_email",email);
		
		response.sendRedirect("indexAdmin.jsp");
		
		
	}

	
	
response.sendRedirect("create_admin.jsp?msg=invalid");
}
}


catch(Exception e){
System.out.print(e);


}
%>
