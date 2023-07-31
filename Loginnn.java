import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Loginnn extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("userName");
        String pass = request.getParameter("pwd");
        if (uname.equals("vivek") && pass.equals("abc")) {
            HttpSession session = request.getSession();
            session.setAttribute("username", uname);
            response.sendRedirect("customerCollectorReport.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

}