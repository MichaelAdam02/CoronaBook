<%-- 
    Document   : user
    Created on : 27.03.2020, 13:15:11
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.3.1/dist/css/uikit.min.css" /> 
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.3.1/dist/js/uikit.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.3.1/dist/js/uikit-icons.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <title>JSP Page</title>
    </head>
    <body>



        <nav class="uk-navbar-container uk-margin" uk-navbar="mode: click">

            <div class="uk-navbar-left">

                <ul class="uk-navbar-nav">
                    <li class="uk-active"><a href="#">Active</a></li>

                    <li><a href="#">Item</a></li>
                </ul>

            </div>
            
            <div class="uk-navbar-right"> 
                <ul class="uk-navbar-nav">
                    <li>
                        <a href="#"  uk-navbar-toggle-icon>User <%=user%> &nbsp;&nbsp;</a>
                        <div class="uk-navbar-dropdown">
                            <ul class="uk-nav uk-navbar-dropdown-nav">
                                <li><a href="#">Item</a></li>
                                <li><a href="#">Item</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>

        </nav>

        <h1>Hello <%=user%>!</h1>
        
        <a class="uk-button uk-button-default" href="createPost.jsp">Create a new post</a>
    </body>
</html>
