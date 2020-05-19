<%-- 
    Document   : createPost
    Created on : 19.05.2020, 17:19:03
    Author     : Michael ADAM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="at.michaeladam.coronabook.db.DBAccess"%>
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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.3.1/dist/css/uikit.min.css" /> 
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.3.1/dist/js/uikit.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.3.1/dist/js/uikit-icons.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


    </head>
    <body>

        <form action="/CoronaBook/newPostHandler" method="post">
            <fieldset class="uk-fieldset">

                <legend class="uk-legend">Postcreator</legend>

                <div class="uk-margin">
                    <input class="uk-input" type="text" placeholder="Title" name="title">
                </div>

                <div class="uk-margin">

                    <select class="uk-select" name="previousPost"> 
                        <option>None</option>>
                        <%                            DBAccess db = DBAccess.getInstance();
                            PreparedStatement posts = db.prepareStatement("SELECT title FROM cb.post WHERE uid = (SELECT uid FROM cb.user u WHERE u.name=?)");
                            posts.setString(1, user);
                            ResultSet rs = posts.executeQuery();

                            while (rs.next()) {
                                String title = rs.getString(1);
                                out.write("<option> " + title + "</option>\n");
                            }


                        %>
                    </select>
                </div>

                <div class="uk-margin">
                    <textarea class="uk-textarea" rows="4" placeholder="<p>Intro in html or Text</p>" name="intro"></textarea>
                </div>
                <div class="uk-margin">
                    <textarea class="uk-textarea" rows="12" placeholder="<p>Content in html or Text</p>" name="content"></textarea>
                </div>
                <div class="uk-margin">
                <button class="uk-button uk-button-primary uk-button-large uk-width-1-1">Post</button>
                </div>


            </fieldset>
        </form>


    </body>
</html>
