<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/9
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home page</title>
</head>
<body>
<%
    String email = (String) session.getAttribute("email");
    if (email==null) {
        response.sendRedirect("index.jsp");
    }
%>
<h1>首页</h1>
登录用户：<%=session.getAttribute("email")%><br>
<a href="2.jsp">go to page 2...</a><br>
<%=session.getId()%><br>
<a href="\logout">注销</a><br>
user-agent：<%=session.getAttribute("user")%><br>
</body>
</html>
