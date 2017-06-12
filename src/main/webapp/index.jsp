<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/6
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index page</title>
</head>
<body>
<h1>index</h1>
<form action="/login" method="post">
    <input type="text" name="email" placeholder="邮箱"><br>
    <input type="password" name="password" placeholder="密码" ><br>
    <input type="submit" value="登录">
</form>
<a href="signup.jsp">注册</a>
<%
    String message = (String) request.getAttribute("message");
    if (message!=null) {
                out.print(message);
    }
%>
<br>
<%=session.getId()%>
    <%--<input type="text" name="email" placeholder="邮箱" size="100" maxlength="10"><br>--%>
    <%--<input type="password" name="password" placeholder="密码" style="height: 100px;"><br>--%>
<%--<pre>
    表单提交方式
    form method
    get 默认
    1. 地址栏显示表单参数 不安全
    2. 参数长度有限
    post
    1. 不显示
    2. 没有限制
</pre>--%>

<%--<pre>
    form
        action
        method

      表单控件

      input type=""
      文本输入框 text
      密码输入框 password
      单选按钮 radio
      复选框 checkbox
      隐藏域 hidden
      文件上传 file
      提交按钮 submit
      重置按钮 reset
      按钮 button

      下拉列表select + option
      文本输入域 textarea
  </pre>--%>
</body>
</html>
