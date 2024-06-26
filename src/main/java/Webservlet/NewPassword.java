package Webservlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.addHeader("Content-Security-Policy", "default-src 'self'; "
//                + "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; "
//                + "script-src 'self' 'unsafe-inline' https://code.jquery.com; "
//                + "frame-ancestors 'self'; "
//                + "media-src 'self' http://localhost:8080/MusicLibrary/songs; "
//                + "font-src 'self' https://cdn.linearicons.com https://fonts.gstatic.com;");
//        response.setHeader("X-Frame-Options", "DENY");
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://34.126.100.6/musicLibrary?useSSL=false", "root",
                        "tientinhty00");
                PreparedStatement pst = con.prepareStatement("update USER set PASS = ? where GMAIL = ? ");
                pst.setString(1, newPassword);
                String userEmail = (String) session.getAttribute("email");
                if (userEmail == null || userEmail.isEmpty()) {
                    // Xử lý trường hợp thuộc tính email không hợp lệ
                } else {
                    // Sử dụng biến userEmail để xử lý tiếp theo
                }

                pst.setString(2, (String) session.getAttribute("email"));

                int rowCount = pst.executeUpdate();
                if (rowCount > 0) {
                    request.setAttribute("status", "resetSuccess");
                    dispatcher = request.getRequestDispatcher("index.jsp");
                } else {
                    request.setAttribute("status", "resetFailed");
                    dispatcher = request.getRequestDispatcher("index.jsp");
                }
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
