<%-- 
    Document   : post
    Created on : 18.05.2020, 09:11:16
    Author     : Michael ADAM
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="at.michaeladam.coronabook.db.DBAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    DBAccess db = DBAccess.getInstance();
    
    PreparedStatement postData = db.prepareStatement("SELECT * FROM cb.post WHERE postid=?");
    try {
            
            postData.setInt(1, Integer.parseInt(request.getParameter("postid")));
            
    } catch (NumberFormatException numberFormatException) {
        response.sendRedirect("index.jsp");  
    }
    
    
    ResultSet rs = postData.executeQuery();
    
    boolean error = !rs.next();
    
    if(error) {
        response.sendRedirect("index.jsp");
    }
    
    PreparedStatement userstmt = db.prepareStatement("SELECT name FROM cb.user WHERE uid = "+rs.getString("uid"));
    ResultSet userResult = userstmt.executeQuery();
    userResult.next();
    String autor = userResult.getString(1);
    
    
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d. MMM u");
    
    String date = rs.getDate("date").toLocalDate().format(formatter);
    
    
    
    // 5. May 2020
    
    String intro = rs.getString("intro");
    String content = rs.getString("content");
    
    String title = rs.getString("title");
    
    
    
   
    
    
    
    
    
    //SELECT * FROM cb.post WHERE postid=3;
    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        
    <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        
        <style>
            html {
	font: 16px "Roboto", sans-serif; font-weight: 400; 
	font-family: 'Roboto', sans-serif;
        }

        * {
          box-sizing: border-box;
        }

        .contentbody{  
          padding: 20px;
        }



        .fakeimg {
          background-color: #aaa;
          width: 100%;
          padding: 20px;
        }


        .row:after {
          content: "";
          display: table;
          clear: both;
        }


         #firstNav{
            background: rgba(0, 0, 0, 0.4);
         }

 </style>
        
    </head>
   <body>


    <nav id="firstNav">
      <div class="nav-wrapper">
        <a href="#!" class="brand-logo">Logo</a>
		   <ul id="nav-mobile" class="right hide-on-med-and-down"> 
      </ul>
	 </div>
    </nav>  
        
	

<div class="contentbody">
      

	<div class="row">
	  <div class="col s9">
		<div class="card">
			<div class="card-content">                           
                          <h7>Topic,<%=date%></h7>
			  <h2><%=title%></h2>
			  <h8><%=date%></h8>
                          <h7>Autor, <%=autor%> </h7>
                          </br>
                          <h7><%=intro%></h7>
                          </br>
                          
                          
                          
                          
                          <%=content%>
                          
                          
			 </div>
	   </div> 
	  </div>
	  
	  
	  
	  <div class="col s3" style="right: 0;position:fixed"> 
		<div class="card">
			<div class="card-content">
			  <h3>Related Posts</h3>
			  <div class="fakeimg">Liste</div><br>
			  <div class="fakeimg">Previous</div><br>
			  <div class="fakeimg">Next</div> 
			  <h3>Follow Me</h3> 
			</div>
		 </div>
	  </div>
	</div>
</div>
 
</body>
</html>
