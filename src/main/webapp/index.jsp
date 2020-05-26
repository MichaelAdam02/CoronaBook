<%-- 
    Document   : index
    Created on : 20.03.2020, 16:29:34
    Author     : Michael ADAM
--%>
 
<%@page import="at.michaeladam.coronabook.GlobalConfig"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="at.michaeladam.coronabook.db.DBAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>    
<%
    String user = (String) request.getSession().getAttribute("username");


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

        <h1>Hello <%=user != null ? user : ""%>!</h1>

        <%
         PreparedStatement pstm = DBAccess.getInstance().prepareStatement("SELECT title,intro,postid,(SELECT name FROM cb.user u WHERE u.uid=c.uid),date FROM cb.post c ORDER BY date LIMIT 9");
          
         ResultSet res = pstm.executeQuery();
        
         
         int x = 0;
         
         do {
             
             out.print("<div class='uk-grid-small uk-child-width-expand@s uk-text-center' uk-grid>");
             
             for(int s = 0; s < 3 && res.next(); s++){
                 
             out.print("<div>");
             out.print("<div class='uk-card uk-card-default uk-card-body'>"); 
             out.print("<h3 class='uk-card-title'>"+res.getString("title")+"</h3>");
             
              

            String date = res.getDate("date").toLocalDate().format(GlobalConfig.default_dtf_formatter);

                
             out.print("<p>"+res.getString("title")+" by "+res.getString("name")+"<p>");
             out.print("<p>"+date+"</p>");
             out.print("<p>"+res.getString("intro")+"</p>"); 
             
             out.print("<div class='uk-card-footer'>"+
                       "<a href='post.jsp?postid="+res.getString("postid")+"' class='uk-button uk-button-text'>Read more</a>"+
                       "</div>");
             out.print("</div>");
             out.print("</div>");
             }
             
             
             
             out.print("</div>");
         } while(res.next());

        %>

         
 

    </body>

</html>
