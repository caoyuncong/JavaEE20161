<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/11
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>csdn page</title>
</head>
<body>
<%
    String plainPassword = request.getParameter("password");
//    String encryptedPassword=DigestUtils.md5Hex(plainPassword);
    out.println(plainPassword);
    new Driver();
    String url = "jdbc:mysql:///db_csdn?user=root&password=system";
    Connection connection = DriverManager.getConnection(url);
    String sql = "select * from db_csdn.user WHERE password=?";
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1,plainPassword);
    ResultSet resultSet = preparedStatement.executeQuery();
    resultSet.next();
    


%>
</body>
</html>
