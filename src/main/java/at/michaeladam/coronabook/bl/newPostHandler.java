package at.michaeladam.coronabook.bl;

import at.michaeladam.coronabook.db.DBAccess;
import at.michaeladam.coronabook.user.PasswordManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Michael ADAM
 */

@WebServlet(name = "newPostHandler", urlPatterns = {"/newPostHandler"})
public class newPostHandler extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Todo: Statistics
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); 
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           DBAccess db = DBAccess.getInstance();
           
           PreparedStatement post = db.prepareStatement("INSERT INTO cb.post(uid, date, intro, content, prev, title)\n" +
                                                        "	VALUES ((SELECT uid FROM cb.user WHERE name=?), CURRENT_DATE, ?, ?, ?, ?);" );
           post.setString(1, (String) request.getSession().getAttribute("username"));
           post.setString(2, (String) request.getParameter("intro"));
           post.setString(3, (String) request.getParameter("content"));
           int prev = 1; //TODO // request.getParameter("content");
           post.setInt(4, 0);
           post.setString(5, (String) request.getParameter("title"));
           
           System.out.println(post.execute());
            
            
        } catch(Exception e){
           e.printStackTrace();
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    
}
