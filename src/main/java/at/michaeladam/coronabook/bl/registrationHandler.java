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
@WebServlet(name = "registrationHandler", urlPatterns = {"/registrationHandler"})
public class registrationHandler extends HttpServlet {

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
            processRequest(request, response);

            DBAccess db = DBAccess.getInstance();

            String username = request.getParameter("username").toLowerCase();
            String email = request.getParameter("email").toLowerCase();
            String password = request.getParameter("password");

            PreparedStatement pstm = db.prepareStatement("INSERT INTO cb.user(name, password, email) VALUES (?, ?, ?);");

            String salt = PasswordManager.createSalt();
            String pwString = PasswordManager.getPasswordString(salt, password);

            pstm.setString(1, username);
            pstm.setString(2, pwString);

            if (!email.contains("@")) {
                request.getSession().setAttribute("error", "Email needs to contain an @-Symbol");
                response.sendRedirect("login/register.jsp");
            }
            if (email.contains(" ")) {
                request.getSession().setAttribute("error", "Email cant contain Whitespaces.");
                response.sendRedirect("login/register.jsp");

            }

            pstm.setString(3, email);

            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {  
                if(rs.getWarnings()!=null)
                   response.sendRedirect("login/register.jsp");
                else{
                    
                    request.getSession().setAttribute("error", rs.getWarnings().toString());
                    response.sendRedirect("login/register.jsp");
                }
                    
            } 
        } catch (SQLException ex) { 
            
                request.getSession().setAttribute("error",  ex.getMessage());
                response.sendRedirect("login/register.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
