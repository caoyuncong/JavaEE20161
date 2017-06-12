<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/8
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test page</title>
</head>
<body>
<%
    new Driver();
    String url="jdbc:mysql:///db_ip?user=root&password=system";
    Connection connection = DriverManager.getConnection(url);
    String sql="SELECT * FROM db_ip.ip WHERE inet_aton(?) BETWEEN inet_aton(min) AND inet_aton(max)";
    PreparedStatement preparedStatement=connection.prepareStatement(sql);
    preparedStatement.setString(1, request.getRemoteAddr());
    ResultSet resultSet=preparedStatement.executeQuery();
    resultSet.next();
    String geo = resultSet.getString("geo");
    out.print(geo);

%>
</body>
</html>
