<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/10
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>IP SEARCH</title>
</head>
<body>
<div style="height: 30px;width: 900px;">IP SEARCH</div>
<form action="ip.jsp">
    <input type="text" name="ip" placeholder="请输入要查询的IP地址">
    <input type="submit" value="查询">
</form>
<%
    String ip = request.getParameter("ip");
    if (ip != null) {

        new Driver();
        String url = "jdbc:mysql:///db_javaee?user=root&password=system";
        Connection connection = DriverManager.getConnection(url);
        String sql = "SELECT * FROM db_ip.ip WHERE inet_aton(?) BETWEEN inet_aton(min) AND inet_aton(max)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, ip);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        out.print(ip + "的地理位置是：" + resultSet.getString("geo"));
        resultSet.close();
        preparedStatement.close();
        connection.close();
    }
%>
</body>
</html>
