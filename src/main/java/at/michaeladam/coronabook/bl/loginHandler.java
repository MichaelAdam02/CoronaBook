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
@WebServlet(name = "loginHandler", urlPatterns = {"/loginHandler"})
public class loginHandler extends HttpServlet {

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
                    response.sendRedirect("/CoronaBook/index.jsp");
                } else {
                    request.getSession().setAttribute("error", "Wrong password");
                    response.sendRedirect("/login/login.jsp");

                }

            } else {
                request.getSession().setAttribute("error", "User not found");
                response.sendRedirect("/login/login.jsp");

            }
        } catch (SQLException ex) {
                request.getSession().setAttribute("error", ex.getMessage());
                response.sendRedirect("login/login.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
