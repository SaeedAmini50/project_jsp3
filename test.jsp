<%@ page import="java.sql.*" %>

<%
// برقراری ارتباط با پایگاه داده
String url = "jdbc:mysql://localhost:3306/saeed";
String username = "root";
String password = "saeed";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(url, username, password);
    statement = connection.createStatement();
    
    // نمایش جدول
    String table_name = "student";
    String query = "SELECT * FROM " + table_name;
    resultSet = statement.executeQuery(query);
    
    while (resultSet.next()) {
        out.println(resultSet.getString(1)); // نمایش فیلد‌های مورد نظر
        // ...
    }
    
    // جستجو در جدول
    String column_name = "name";
    String search_value = "saeed";
    query = "SELECT * FROM " + table_name + " WHERE " + column_name + " = '" + search_value + "'";
    resultSet = statement.executeQuery(query);
    
    while (resultSet.next()) {
        out.println(resultSet.getString(1)); // نمایش فیلد‌های مورد نظر
        // ...
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // بستن اتصالات و منابع
    if (resultSet != null) {
        resultSet.close();
    }
    if (statement != null) {
        statement.close();
    }
    if (connection != null) {
        connection.close();
    }
}
%>