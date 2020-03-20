<%-- 
    Document   : index
    Created on : 20.03.2020, 16:29:34
    Author     : Michael ADAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>    
<%
    String user = (String) request.getSession().getAttribute("username");
    if (user == null) {
        response.sendRedirect("login/login.jsp");
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello <%=user%>!</h1>
    </body>

</html>
