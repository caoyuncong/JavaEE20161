<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/10
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>page 2</title>
</head>
<body>
<%
    String email = (String) session.getAttribute("email");
    if (email==null) {
        response.sendRedirect("index.jsp");
    }
%>
登录用户：<%=session.getAttribute("email")%><br>
<%=session.getId()%>
</body>
</html>
