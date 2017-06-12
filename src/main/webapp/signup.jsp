<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/9
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sign up page</title>
</head>
<body>
<h1>注册</h1>
<form action="/register" method="post">
    <input type="text" name="email" placeholder="邮箱"><br>
    <input type="password" name="password" placeholder="密码"><br>
    城市 <select name="city" multiple="multiple">
    <option value="北京">北京</option>
    <option value="上海">上海</option>
    <option value="广州">广州</option>
</select><br>
    兴趣
    <input type="checkbox" name="hobby" value="电影">电影
    <input type="checkbox" name="hobby" value="读书">读书
    <input type="checkbox" name="hobby" value="游戏">游戏
    <br>
    <input type="submit" value="注册">
</form>
<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
        out.print(message);
    }
%>
</body>
</html>
