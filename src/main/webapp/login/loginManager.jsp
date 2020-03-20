<%-- 
    Document   : loginManager
    Created on : 20.03.2020, 15:57:37
    Author     : Michael ADAM
--%>

<%@page import="at.michaeladam.coronabook.user.PasswordManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="at.michaeladam.coronabook.db.DBAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Handling Login...</title>
    </head> 
    <body>
        <p>TODO: Error</p>
        <%
            DBAccess db = DBAccess.getInstance();

            String username = request.getParameter("username").toLowerCase();
            String password = request.getParameter("password");

            PreparedStatement pstm = db.prepareStatement("SELECT uid, name, password FROM cb.user WHERE name=?;");

            pstm.setString(1, username);

            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                boolean isPasswordRight = PasswordManager.checkPassword(rs.getString(3), password);

                if (isPasswordRight) {
                    request.getSession().setAttribute("username", rs.getString(2));
                    request.getSession().setAttribute("id", rs.getString(1));
                    response.sendRedirect("../index.jsp");
                } else {
                    request.getSession().setAttribute("error", "Wrong password");
                    response.sendRedirect("login.jsp");

                }

            } else {
                request.getSession().setAttribute("error", "User not found");
                response.sendRedirect("login.jsp");

            }
        %>
    </body>
</html>
